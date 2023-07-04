import 'package:butler_labs/models/butler_field.dart';
import 'package:butler_labs/models/butler_table.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'butler_result.g.dart';

@JsonSerializable(explicitToJson: true)
class ButlerResult {
  String? documentId;

  String? documentStatus;

  String? fileName;

  String? mimeType;

  String? documentType;

  String? confidenceScore;

  List<ButlerField>? formFields;

  List<ButlerTable>? tables;

  ButlerResult();

  ButlerResult.fromButlerResult(ButlerResult result);

  factory ButlerResult.fromJson(Map<String, dynamic> json) => _$ButlerResultFromJson(json);

  Map<String, dynamic> toJson() => _$ButlerResultToJson(this);
}

/// https://docs.butlerlabs.ai/reference/health-insurance-card-ocr
@JsonSerializable(explicitToJson: true)
class InsuranceCard implements ButlerResult {

  @override
  String? confidenceScore;

  @override
  String? documentId;

  @override
  String? documentStatus;

  @override
  String? documentType;

  @override
  String? fileName;

  @override
  List<ButlerField>? formFields;

  @override
  String? mimeType;

  @override
  List<ButlerTable>? tables;

  InsuranceCard();

  String? get memberName {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Member Name')?.value;
  }

  String? get idNumber {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'ID Number')?.value;
  }

  String? get groupNumber {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Group Number')?.value;
  }

  String? get insurer {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Insurer')?.value;
  }

  @override
  factory InsuranceCard.fromButlerResult(ButlerResult result) => InsuranceCard.fromJson(result.toJson());

  @override
  factory InsuranceCard.fromJson(Map<String, dynamic> json) => _$InsuranceCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InsuranceCardToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriversLicense implements ButlerResult {

  @override
  String? confidenceScore;

  @override
  String? documentId;

  @override
  String? documentStatus;

  @override
  String? documentType;

  @override
  String? fileName;

  @override
  List<ButlerField>? formFields;

  @override
  String? mimeType;

  @override
  List<ButlerTable>? tables;

  DriversLicense();

  String? get firstName {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'First Name')?.value;
  }

  String? get lastName {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Last Name')?.value;
  }

  String? get region {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Region')?.value;
  }

  String? get documentNumber {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Document Number')?.value;
  }

  String? get vehicleClassification {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Vehicle Classification')?.value;
  }

  String? get expirationDate {
    return formFields?.firstWhereOrNull((element) => element.fieldName == 'Expiration Date')?.value;
  }

  @override
  factory DriversLicense.fromJson(Map<String, dynamic> json) => _$DriversLicenseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DriversLicenseToJson(this);
}

class Test extends ButlerResult{

}
