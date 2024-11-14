import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/models/agency_model.dart';
import 'dart:convert';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:ijob_app/providers/add_agency_form_provider.dart';

final fetchAgencyProvider = FutureProvider<List<AgencyModel>>(
  (ref) async {
    try {
      final restOperation = Amplify.API.get('agencies');
      final response = await restOperation.response;

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.decodeBody());

        final List<dynamic> agencyData = jsonResponse;

        final List<AgencyModel> agencies = agencyData.map((agencyJson) {
          return AgencyModel.fromMap(agencyJson as Map<String, dynamic>);
        }).toList();

        print('List of agencies fetched: $agencies');
        return agencies;
      } else {
        throw Exception('Failed to fetch agencies: ${response.statusCode}');
      }
    } on ApiException catch (e) {
      throw Exception('Failed to fetch agencies: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  },
);

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
      return 200;
    } else {
      throw Exception('Failed to post agency: ${response.statusCode}');
    }
  } on ApiException catch (e) {
    throw Exception('Failed to post agency: ${e.message}');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
});

final uploadLogoProvider = FutureProvider<void>((ref) async {
  final platformFile = ref.watch(filePickerProvider);
  if (platformFile == null) {
    throw Exception('No file selected for upload');
  }

  try {
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(
        platformFile.readStream!,
        size: platformFile.size,
      ),
      path: StoragePath.fromString('public/logoimage_${DateTime.now()}'),
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
