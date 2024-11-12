import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/providers/agency_provider.dart';
import 'package:ijob_app/screens/agency_add.dart';
import 'package:ijob_app/widgets/list_agency_widget.dart';

class ListAgency extends ConsumerWidget {
  const ListAgency({super.key});

  void _addAgency(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AgencyAdd()),
    );
  }

  Future<void> signOutGlobally() async {
    final result = await Amplify.Auth.signOut(
      options: const SignOutOptions(globalSignOut: true),
    );
    if (result is CognitoCompleteSignOut) {
      safePrint('Sign out completed successfully');
    } else if (result is CognitoPartialSignOut) {
      final globalSignOutException = result.globalSignOutException!;
      final accessToken = globalSignOutException.accessToken;
      safePrint('Error signing user out: ${globalSignOutException.message}');
    } else if (result is CognitoFailedSignOut) {
      safePrint('Error signing user out: ${result.exception.message}');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAgencies = ref.watch(fetchAgencyProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách Agency",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () => _addAgency(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: signOutGlobally,
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const ListAgencyWidget(),
    );
  }
}
