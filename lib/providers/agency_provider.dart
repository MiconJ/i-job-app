import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/models/agency_model.dart';
import 'dart:convert';

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

        print('List agency call from provider: $agencies');
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

final createAgencyProvider = FutureProvider<void>((ref) async {
  try {
    final agencyData = ref.watch(createAgencyDataProvider);

    final restOperation = Amplify.API.post(
      'agencies',
      body: HttpPayload.json(agencyData),
    );
    final response = await restOperation.response;

    if (response.statusCode == 200) {
      
      print('Post call succeeded');
    } else {
      throw Exception('Failed to post agency: ${response.statusCode}');
    }
  } on ApiException catch (e) {
    throw Exception('Failed to post agency: ${e.message}');
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
});