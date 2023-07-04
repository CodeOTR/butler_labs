import 'package:butler_labs/models/butler_field.dart';
import 'package:butler_labs/models/butler_table.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'butler_result.g.dart';

@JsonSerializable(explicitToJson: true)
class ButlerResult {
  String? documentId;

  /// The uploadId is used to delete the document and results after if needed.
  String? uploadId;

  String? documentStatus;

  String? fileName;

  String? mimeType;

  String? documentType;

  String? confidenceScore;

  List<ButlerField>? formFields;

  List<ButlerTable>? tables;

  ButlerResult();

  String? getField(String fieldName) {
    return formFields?.firstWhereOrNull((element) => element.fieldName == fieldName)?.value;
  }

  ButlerResult.fromButlerResult(ButlerResult result);

  factory ButlerResult.fromJson(Map<String, dynamic> json) => _$ButlerResultFromJson(json);

  Map<String, dynamic> toJson() => _$ButlerResultToJson(this);
}

/// https://docs.butlerlabs.ai/reference/health-insurance-card-ocr
@JsonSerializable(explicitToJson: true)
class InsuranceCard extends ButlerResult {
  InsuranceCard();

  String? get memberName => getField('Member Name');

  String? get idNumber => getField('ID Number');

  String? get groupNumber => getField('Group Number');

  String? get insurer => getField('Insurer');

  factory InsuranceCard.fromButlerResult(ButlerResult result) => InsuranceCard.fromJson(result.toJson());

  factory InsuranceCard.fromJson(Map<String, dynamic> json) => _$InsuranceCardFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceCardToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriversLicense extends ButlerResult {
  DriversLicense();

  /// Given name and middle name if applicable
  String? get firstName => getField('First Name');

  /// Surname
  String? get lastName => getField('Last Name');

  /// State that issued the driver's license
  String? get region => getField('Region');

  /// Driver's license number
  String? get documentNumber => getField('Document Number');

  /// Class of vehicles the driver is allowed to operate
  String? get vehicleClassification => getField('Vehicle Classification');

  /// Date of expiry of the license
  String? get expirationDate => getField('Expiration Date');

  factory DriversLicense.fromButlerResult(ButlerResult result) => DriversLicense.fromJson(result.toJson());

  factory DriversLicense.fromJson(Map<String, dynamic> json) => _$DriversLicenseFromJson(json);

  Map<String, dynamic> toJson() => _$DriversLicenseToJson(this);
}
