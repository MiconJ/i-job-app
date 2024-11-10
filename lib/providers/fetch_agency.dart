import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/models/agency_model.dart';
import 'dart:convert';

final fetchAgencyProvider = FutureProvider<AgencyModel>((ref) async {
  try {
    final restOperation = Amplify.API.get('agencies-dev');
    final response = await restOperation.response;
    print('response from api: $response');

    if (response.statusCode == 200) {
      final data = json.decode(response.decodeBody());
      final agency = AgencyModel.fromJson(data);
      print('response from fetch data 200code: $agency');
      return agency;
    } else {
      throw Exception('Failed to fetch agency: ${response.statusCode}');
    }
  } on ApiException catch (e) {
    throw Exception('Failed to fetch agency: ${e.message}');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
});
