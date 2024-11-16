import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/models/agency_model.dart';
import 'dart:convert';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:ijob_app/providers/add_agency_form_provider.dart';

//Fetch agencies data from AWS
final fetchAgencyProvider = FutureProvider<List<AgencyModel>>((ref) async {
  try {
    final restOperation = Amplify.API.get('agencies');
    final response = await restOperation.response;

    if (response.statusCode == 200) {
      print('Response: $response');
      final List<dynamic> agencyData = json.decode(response.decodeBody());
      return agencyData.map((agencyJson) {
        return AgencyModel.fromMap(agencyJson as Map<String, dynamic>);
      }).toList();
    } else {
      throw Exception('Failed to fetch agencies: ${response.statusCode}');
    }
  } catch (e) {
    safePrint('An error occurred: $e');
    throw e;
  }
});

final agenciesProvider = Provider<AsyncValue<List<AgencyModel>>>((ref) {
  return ref.watch(fetchAgencyProvider);
});

final searchAgenciesProvider =
    StateNotifierProvider<SearchAgenciesNotifier, List<AgencyModel>>((ref) {
  final agencies = ref.watch(agenciesProvider);
  return SearchAgenciesNotifier(agencies);
});

//Search data based on fetchAgency
class SearchAgenciesNotifier extends StateNotifier<List<AgencyModel>> {
  final AsyncValue<List<AgencyModel>> _agencies;
  SearchAgenciesNotifier(this._agencies) : super(_agencies.value ?? []);

  void searchAgencies(String query) {
    print('print from search: $query');
    _agencies.whenData((agencies) {
      if (query.isEmpty) {
        state = agencies;
      } else {
        state = agencies.where((agency) {
          return agency.agencyName.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }
}

// POST agency data to AWS dynamoDB
final createAgencyProvider = FutureProvider<int>((ref) async {
  await ref.watch(uploadLogoProvider.future);

  final agencyData = await ref.watch(createAgencyDataProvider.future);

  try {
    final restOperation = Amplify.API.post(
      'agencies',
      body: HttpPayload.json(agencyData),
    );
    final response = await restOperation.response;

    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      throw Exception('Failed to post agency: ${response.statusCode}');
    }
  } on ApiException catch (e) {
    throw Exception('Failed to post agency: ${e.message}');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
});

//Upload logoimage
final uploadLogoProvider = FutureProvider<void>((ref) async {
  final platformFile = ref.watch(filePickerProvider);
  if (platformFile == null) {
    return null;
  }
  try {
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(
        platformFile.readStream!,
        size: platformFile.size,
      ),
      path: StoragePath.fromString(
          'public/logoimage_${DateTime.now().toIso8601String()}'),
      onProgress: (progress) {
        safePrint('Fraction completed: ${progress.fractionCompleted}');
      },
    ).result;

    safePrint('Successfully uploaded file: ${result.uploadedItem.path}');
    final url =
        'https://ijob2e0d21e958c684e51b22b5c052c9363e3edf11-dev.s3.ap-southeast-1.amazonaws.com/${result.uploadedItem.path}';
    ref.read(agencyLogoUrlProvider.notifier).state = url;
  } on StorageException catch (e) {
    throw Exception('Failed to upload file: ${e.message}');
  }
});

// GET accessToken from Auth
final accessTokenProvider = FutureProvider<String?>((ref) async {
  try {
    AuthSession session = await Amplify.Auth.fetchAuthSession();
    if (session.isSignedIn) {
      CognitoAuthSession cognitoSession = session as CognitoAuthSession;
      return cognitoSession.credentialsResult.value.sessionToken;
      ;
    } else {
      return null;
    }
  } on AuthException catch (e) {
    safePrint('Error fetching auth session: ${e.message}');
    return null;
  }
});
