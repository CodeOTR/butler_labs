// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'butler_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButlerResult _$ButlerResultFromJson(Map<String, dynamic> json) => ButlerResult()
  ..documentId = json['documentId'] as String?
  ..documentStatus = json['documentStatus'] as String?
  ..fileName = json['fileName'] as String?
  ..mimeType = json['mimeType'] as String?
  ..documentType = json['documentType'] as String?
  ..confidenceScore = json['confidenceScore'] as String?
  ..formFields = (json['formFields'] as List<dynamic>?)
      ?.map((e) => ButlerField.fromJson(e as Map<String, dynamic>))
      .toList()
  ..tables = (json['tables'] as List<dynamic>?)
      ?.map((e) => ButlerTable.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ButlerResultToJson(ButlerResult instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'documentStatus': instance.documentStatus,
      'fileName': instance.fileName,
      'mimeType': instance.mimeType,
      'documentType': instance.documentType,
      'confidenceScore': instance.confidenceScore,
      'formFields': instance.formFields?.map((e) => e.toJson()).toList(),
      'tables': instance.tables?.map((e) => e.toJson()).toList(),
    };

InsuranceCard _$InsuranceCardFromJson(Map<String, dynamic> json) =>
    InsuranceCard()
      ..confidenceScore = json['confidenceScore'] as String?
      ..documentId = json['documentId'] as String?
      ..documentStatus = json['documentStatus'] as String?
      ..documentType = json['documentType'] as String?
      ..fileName = json['fileName'] as String?
      ..formFields = (json['formFields'] as List<dynamic>?)
          ?.map((e) => ButlerField.fromJson(e as Map<String, dynamic>))
          .toList()
      ..mimeType = json['mimeType'] as String?
      ..tables = (json['tables'] as List<dynamic>?)
          ?.map((e) => ButlerTable.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$InsuranceCardToJson(InsuranceCard instance) =>
    <String, dynamic>{
      'confidenceScore': instance.confidenceScore,
      'documentId': instance.documentId,
      'documentStatus': instance.documentStatus,
      'documentType': instance.documentType,
      'fileName': instance.fileName,
      'formFields': instance.formFields?.map((e) => e.toJson()).toList(),
      'mimeType': instance.mimeType,
      'tables': instance.tables?.map((e) => e.toJson()).toList(),
    };

DriversLicense _$DriversLicenseFromJson(Map<String, dynamic> json) =>
    DriversLicense()
      ..confidenceScore = json['confidenceScore'] as String?
      ..documentId = json['documentId'] as String?
      ..documentStatus = json['documentStatus'] as String?
      ..documentType = json['documentType'] as String?
      ..fileName = json['fileName'] as String?
      ..formFields = (json['formFields'] as List<dynamic>?)
          ?.map((e) => ButlerField.fromJson(e as Map<String, dynamic>))
          .toList()
      ..mimeType = json['mimeType'] as String?
      ..tables = (json['tables'] as List<dynamic>?)
          ?.map((e) => ButlerTable.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DriversLicenseToJson(DriversLicense instance) =>
    <String, dynamic>{
      'confidenceScore': instance.confidenceScore,
      'documentId': instance.documentId,
      'documentStatus': instance.documentStatus,
      'documentType': instance.documentType,
      'fileName': instance.fileName,
      'formFields': instance.formFields?.map((e) => e.toJson()).toList(),
      'mimeType': instance.mimeType,
      'tables': instance.tables?.map((e) => e.toJson()).toList(),
    };
