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
  final int agencyType;
  final int accountNumber;
  final int limitAccount;
  final int limitCv;
  final int trialFlag;
  final int lockFlag;
  final int deleteFlag;
  final DateTime createAt;

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
    required this.limitAccount,
    required this.limitCv,
    required this.trialFlag,
    required this.accountNumber,
    required this.lockFlag,
    required this.deleteFlag,
    required this.createAt,
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
      'agencyEstablishmentDate':
          agencyEstablishmentDate?.millisecondsSinceEpoch,
      'agencyType': agencyType,
      'accountNumber': accountNumber,
      'limitAccount': limitAccount,
      'limitCv': limitCv,
      'trialFlag': trialFlag,
      'lockFlag': lockFlag,
      'deleteFlag': deleteFlag,
      'createAt': createAt.millisecondsSinceEpoch,
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
      agencyType: map['agencyType'] as int,
      accountNumber: map['accountNumber'] as int,
      limitAccount: map['limitAccount'] as int,
      limitCv: map['limitCv'] as int,
      trialFlag: map['trialFlag'] as int,
      lockFlag: map['lockFlag'] as int,
      deleteFlag: map['deleteFlag'] as int,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyModel.fromJson(String source) =>
      AgencyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
