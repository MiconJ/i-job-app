import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

final extablishedAtProvider = StateProvider<DateTime>((Ref) {
  return DateTime.now();
});

final createAtProvider = StateProvider<DateTime>((Ref) {
  return DateTime.now();
});

final agencyNameProvider = StateProvider<String>((Ref) {
  return '';
});

final agencyDescriptionProvider = StateProvider<String>((Ref) {
  return '';
});

final agencyWebsiteUrlProvider = StateProvider<String>((Ref) {
  return '';
});

final agencyTaxNoProvider = StateProvider<String>((Ref) {
  return '';
});

final agencyLogoUrlProvider = StateProvider<String>((Ref) {
  return '';
});

final agencyPhoneNoProvider = StateProvider<String>((Ref) {
  return '';
});

final agencyEmailAddressProvider = StateProvider<String>((Ref) {
  return '';
});

final agencyCategoryProvider = StateProvider<int>((Ref) {
  return 0;
});

final agencyEmployeeNoProvider = StateProvider<int>((Ref) {
  return 0;
});

final createAgencyDataProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {
    "agencyName": ref.read(agencyNameProvider),
    "agencyDescription": ref.read(agencyDescriptionProvider),
    "agencyEmailAddress": ref.read(agencyEmailAddressProvider),
    "agencyEmployeeNo": ref.read(agencyEmployeeNoProvider),
    "agencyEstablishmentDate": ref.read(extablishedAtProvider) == null
        ? null
        : ref.read(extablishedAtProvider).toIso8601String(),
    "agencyLogoUrl": ref.read(agencyLogoUrlProvider),
    "agencyPhoneNo": ref.read(agencyPhoneNoProvider),
    "agencyTaxNo": ref.read(agencyTaxNoProvider),
    "agencyType": ref.read(agencyCategoryProvider),
    "agencyWebsiteUrl": ref.read(agencyWebsiteUrlProvider),
    "createAt": ref.read(createAtProvider) == null
        ? null
        : ref.read(createAtProvider).toIso8601String(),
  };
});
