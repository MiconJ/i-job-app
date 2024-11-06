// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AgencyModel {
  final String agencyName;
  final String agencyDescription;
  final String? agencyWebsiteUrl;
  final String? agencyTaxNo;
  final String? agencyLogoUrl;
  final String? agencyPhoneNo;
  final String? agencyEmailAddress;
  final int? agencyEmployeeNo;
  final DateTime? agencyEstablishmentDate;

  AgencyModel({
    required this.agencyName,
    required this.agencyDescription,
    this.agencyWebsiteUrl,
    this.agencyTaxNo,
    this.agencyLogoUrl,
    this.agencyPhoneNo,
    this.agencyEmailAddress,
    this.agencyEmployeeNo,
    this.agencyEstablishmentDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'agencyName': agencyName,
      'agencyDescription': agencyDescription,
      'agencyWebsiteUrl': agencyWebsiteUrl,
      'agencyTaxNo': agencyTaxNo,
      'agencyLogoUrl': agencyLogoUrl,
      'agencyPhoneNo': agencyPhoneNo,
      'agencyEmailAddress': agencyEmailAddress,
      'agencyEmployeeNo': agencyEmployeeNo,
      'agencyEstablishmentDate':
          agencyEstablishmentDate?.millisecondsSinceEpoch,
    };
  }

  factory AgencyModel.fromMap(Map<String, dynamic> map) {
    return AgencyModel(
      agencyName: map['agencyName'] as String,
      agencyDescription: map['agencyDescription'] as String,
      agencyWebsiteUrl: map['agencyWebsiteUrl'] != null
          ? map['agencyWebsiteUrl'] as String
          : null,
      agencyTaxNo:
          map['agencyTaxNo'] != null ? map['agencyTaxNo'] as String : null,
      agencyLogoUrl:
          map['agencyLogoUrl'] != null ? map['agencyLogoUrl'] as String : null,
      agencyPhoneNo:
          map['agencyPhoneNo'] != null ? map['agencyPhoneNo'] as String : null,
      agencyEmailAddress: map['agencyEmailAddress'] != null
          ? map['agencyEmailAddress'] as String
          : null,
      agencyEmployeeNo: map['agencyEmployeeNo'] != null
          ? map['agencyEmployeeNo'] as int
          : null,
      agencyEstablishmentDate: map['agencyEstablishmentDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['agencyEstablishmentDate'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyModel.fromJson(String source) =>
      AgencyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
