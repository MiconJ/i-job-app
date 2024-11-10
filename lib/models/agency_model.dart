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
  final String? agencyEstablishmentDate;
  final int agencyType;
  final String? createAt;

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
    required this.agencyType,
    this.createAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'agencyName': agencyName,
      'agencyDescription': agencyDescription,
      'agencyWebsiteUrl': agencyWebsiteUrl,
      'agencyTaxNo': agencyTaxNo,
      'agencyLogoUrl': agencyLogoUrl,
      'agencyPhoneNo': agencyPhoneNo,
      'agencyEmailAddress': agencyEmailAddress,
      'agencyEmployeeNo': agencyEmployeeNo,
      'agencyEstablishmentDate': agencyEstablishmentDate,
      'agencyType': agencyType,
      'createAt': createAt,
    };
  }

  factory AgencyModel.fromMap(Map<String, dynamic> map) {
    return AgencyModel(
      agencyName: map['agencyName'] as String,
      agencyDescription: map['agencyDescription'] as String,
      agencyWebsiteUrl: map['agencyWebsiteUrl'] as String?,
      agencyTaxNo: map['agencyTaxNo'] as String?,
      agencyLogoUrl: map['agencyLogoUrl'] as String?,
      agencyPhoneNo: map['agencyPhoneNo'] as String?,
      agencyEmailAddress: map['agencyEmailAddress'] as String?,
      agencyEmployeeNo: map['agencyEmployeeNo'] as int?,
      agencyEstablishmentDate: map['agencyEstablishmentDate'] as String?,
      agencyType: map['agencyType'] as int,
      createAt: map['createAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyModel.fromJson(String source) =>
      AgencyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
