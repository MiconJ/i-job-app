import 'package:flutter/material.dart';
import 'package:ijob_app/providers/agency_provider.dart';
import 'package:ijob_app/screens/list_agency.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:ijob_app/amplifyconfiguration.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _isAmplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify(ref);
  }

  Future<void> _getAuthToken(WidgetRef ref) async {
    final AsyncValue<String?> accessTokenAsync = ref.watch(accessTokenProvider);

    accessTokenAsync.when(
      data: (accessToken) {
        if (accessToken != null) {
          safePrint('Access Token: $accessToken');
          print('Access Token: $accessToken');
        } else {
          safePrint('User is not signed in or token is null.');
        }
      },
      loading: () => safePrint('Fetching access token...'),
      error: (error, stack) => safePrint('Error: $error'),
    );
  }

  Future<void> _configureAmplify(WidgetRef ref) async {
    try {
      final auth = AmplifyAuthCognito();
      final api = AmplifyAPI();
      final storage = AmplifyStorageS3();

      await Amplify.addPlugins([
        auth,
        api,
        storage,
      ]);

      await Amplify.configure(amplifyconfig);
      await _getAuthToken(ref);

      setState(() {
        _isAmplifyConfigured = true;
      });
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAmplifyConfigured) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return Authenticator(
      child: MaterialApp(
        title: 'i-Job.vn',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(16, 136, 89, 100)),
          useMaterial3: true,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        builder: Authenticator.builder(),
        home: const Scaffold(
          body: Center(
            child: ListAgency(),
          ),
        ),
      ),
    );
  }
}
