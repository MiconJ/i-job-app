import 'package:flutter/material.dart';
import 'package:ijob_app/screens/list_agency.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:ijob_app/amplifyconfiguration.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAmplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      final api = AmplifyAPI();
      final storage = AmplifyStorageS3();
      await Amplify.addPlugins([auth, api, storage]);

      await Amplify.configure(amplifyconfig);
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
      child: ProviderScope(
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
      ),
    );
  }
}
