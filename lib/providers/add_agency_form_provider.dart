import 'package:flutter_riverpod/flutter_riverpod.dart';

final extablishedAtProvider = StateProvider<DateTime>((Ref) {
  return DateTime.now();
});

final agencyCategoryProvider = StateProvider<int>((Ref) {
  return 0;
});

final createAgencyDataProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {
    "agencyName": "TrungND 3",
    "agencyDescription": "TrungND agencyDescription 2",
    "agencyEmailAddress": "agencyEmailAddress",
    "agencyEmployeeNo": 2,
    "agencyEstablishmentDate": "2024/11/22 12:23:44:000000",
    "agencyLogoUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5xrEc0x_9BIifeqj0i7-3aeoVMS6s-6Fbeg&s",
    "agencyPhoneNo": "agencyPhoneNo",
    "agencyTaxNo": "agencyTaxNo",
    "agencyType": 2,
    "agencyWebsiteUrl": "https://facebook.com",
    "createAt": "2024/11/22 12:23:44:000000",
  };
});
