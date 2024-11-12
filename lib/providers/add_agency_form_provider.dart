import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:core';

final extablishedAtProvider = StateProvider<DateTime>((Ref) {
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
"agencyEstablishmentDate": "2024/11/22 12:23:44:000000",
"agencyLogoUrl": ref.read(agencyLogoUrlProvider),
"agencyPhoneNo": ref.read(agencyPhoneNoProvider),
"agencyTaxNo": ref.read(agencyTaxNoProvider),
"agencyType": ref.read(agencyCategoryProvider),
"agencyWebsiteUrl": ref.read(agencyWebsiteUrlProvider),
"createAt": "2024/11/22 12:23:44:000000",
};
});