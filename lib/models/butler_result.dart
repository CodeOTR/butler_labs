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

  /// The Insurer for this Health Insurance Card
  String? get insurer => getField('Insurer');

  /// The ID Number for this Health Insurance Card
  String? get idNumber => getField('ID Number');

  /// The Group Number for this Health Insurance Card
  String? get groupNumber => getField('Group Number');

  /// The Member Name for this Health Insurance Card
  String? get memberName => getField('Member Name');

  /// The Prescription Bank Identification Number (Rx BIN) for this Health Insurance Card
  String? get rxBin => getField('Rx BIN');

  /// The Prescription Processor Control Number (Rx PCN) for this Health Insurance Card
  String? get rxPcn => getField('Rx PCN');

  /// The Prescription Group Number (Rx Group) for this Health Insurance Card
  String? get rxGroup => getField('Rx Group');

  /// The Prescription ID (Rx ID) for this Health Insurance Card
  String? get rxId => getField('Rx ID');

  /// The Prescription Plan (Rx Plan) for this Health Insurance Card
  String? get rxPlan => getField('Rx Plan');

  /// The Dates that this Health Insurance Card is in effect for
  String? get effectiveDate => getField('Effective Date');

  /// The Issuer ID for this Health Insurance Card
  String? get issuerId => getField('Issuer ID');

  factory InsuranceCard.fromButlerResult(ButlerResult result) => InsuranceCard.fromJson(result.toJson());

  factory InsuranceCard.fromJson(Map<String, dynamic> json) => _$InsuranceCardFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceCardToJson(this);
}

/// https://docs.butlerlabs.ai/reference/us-drivers-license-ocr
@JsonSerializable(explicitToJson: true)
class DriversLicense extends ButlerResult {
  DriversLicense();

  /// State that issued the driver's license
  String? get region => getField('Region');

  /// Driver's license number
  String? get documentNumber => getField('Document Number');

  /// Class of vehicles the driver is allowed to operate
  String? get vehicleClassification => getField('Vehicle Classification');

  /// Date of expiry of the license
  String? get expirationDate => getField('Expiration Date');

  /// Surname
  String? get lastName => getField('Last Name');

  /// Given name and middle name if applicable
  String? get firstName => getField('First Name');

  /// Full address of the driver, including street address, city, state, and ZIP code
  String? get fullAddress => getField('Full Address');

  /// Street address portion of the driver's full address
  String? get streetAddress => getField('Street Address');

  /// City portion of the driver's full address
  String? get city => getField('City');

  /// State portion of the driver's full address
  String? get state => getField('State');

  /// ZIP code portion of the driver's full address
  String? get zipCode => getField('ZIP Code');

  /// Date of birth of the driver
  String? get birthDate => getField('Birth Date');

  /// Restrictions on the license
  String? get restrictions => getField('Restrictions');

  /// Endorsements on the license
  String? get endorsements => getField('Endorsements');

  /// Sex of the driver, possible values include "M", "F" and "X"
  String? get sex => getField('Sex');

  /// Hair color of the driver
  String? get hairColor => getField('Hair Color');

  /// Eye color of the driver
  String? get eyeColor => getField('Eye Color');

  /// Height of the driver
  String? get height => getField('Height');

  /// Weight of the driver
  String? get weight => getField('Weight');

  /// Date of issue of the license
  String? get issueDate => getField('Issue Date');

  /// Security code to identify where and when the license was issued
  String? get documentDiscriminator => getField('Document Discriminator');

  factory DriversLicense.fromButlerResult(ButlerResult result) => DriversLicense.fromJson(result.toJson());

  factory DriversLicense.fromJson(Map<String, dynamic> json) => _$DriversLicenseFromJson(json);

  Map<String, dynamic> toJson() => _$DriversLicenseToJson(this);
}

/// https://docs.butlerlabs.ai/reference/passport-ocr
@JsonSerializable(explicitToJson: true)
class Passport extends ButlerResult {
  Passport();

  /// Extracted Passport Number
  String? get documentNumber => getField('Document Number');

  /// Extracted given name and middle initial if applicable
  String? get firstName => getField('First Name');

  /// Extracted surname
  String? get lastName => getField('Last Name');

  /// Extracted date of birth
  String? get birthDate => getField('Birth Date');

  /// Extracted expiration date
  String? get expirationDate => getField('Expiration Date');

  /// Extracted sex. Possible values include "M", "F" and "X"
  String? get sex => getField('Sex');

  /// Country or region code compliant with ISO 3166 standard
  String? get nationality  => getField('Nationality');

  /// Extracted Machine Readable Zone including two lines of 44 characters each
  String? get machineReadableZone => getField('Machine Readable Zone');

  factory Passport.fromButlerResult(ButlerResult result) => Passport.fromJson(result.toJson());

  factory Passport.fromJson(Map<String, dynamic> json) => _$PassportFromJson(json);

  Map<String, dynamic> toJson() => _$PassportToJson(this);
}

/// https://docs.butlerlabs.ai/reference/w9-ocr
@JsonSerializable(explicitToJson: true)
class W9 extends ButlerResult {
  W9();

  /// The Account Numbers for this W9
  String? get accountNumber => getField('Account Number');

  /// The Address for this W9
  String? get address => getField('Address');

  /// The Business Name for this W9
  String? get businessName => getField('Business Name');

  /// The City, State and Zip Code for this W9
  String? get cityStateZip => getField('City State Zip');

  /// The Employer Identification Number for this W9
  String? get EIN => getField('EIN');

  /// The Exempt FATCA Code for this W9
  String? get exemptFATCACode => getField('Exempt FATCA Code');

  /// The Exempt Payee Code for this W9
  String? get exemptPayeeCode => getField('Exempt Payee Code');

  /// The Federal Tax Classification for this W9
  String? get federalTaxClassification => getField('Federal Tax Classification');

  /// The other Federal Tax Classification for this W9
  String? get federalTaxClassificationOther => getField('Federal Tax Classification Other');

  /// The Form Revision Date for this W9
  String? get formRevisionDate => getField('Form Revision Date');

  /// If this W9 has a signature on it
  String? get hasSignature => getField('Has Signature');

  /// If this W9 has a signature date on it
  String? get hasSignatureDate => getField('Has Signature Date');

  /// The LLC Tax Classification for this W9
  String? get LLCClassification => getField('LLC Tax Classification');

  /// The Name on this W9
  String? get name => getField('Name');

  /// The Social Security Number for this W9
  String? get SSN => getField('SSN');

  factory W9.fromButlerResult(ButlerResult result) => W9.fromJson(result.toJson());

  factory W9.fromJson(Map<String, dynamic> json) => _$W9FromJson(json);

  Map<String, dynamic> toJson() => _$W9ToJson(this);
}

/// https://docs.butlerlabs.ai/reference/w2-ocr
@JsonSerializable(explicitToJson: true)
class W2 extends ButlerResult {
  W2();

  /// Allocated Tips for this W2
  String? get allocatedTips => getField('Allocated Tips');

  /// Control Number for this W2
  String? get controlNumber => getField('Control Number');

  /// Dependent Care Benefits for this W2
  String? get dependentCareBenefits => getField('Dependent Care Benefits');

  String? get ein => getField('EIN');

  String? get employeeAddress => getField('Employee Address');

  String? get employeeName => getField('Employee Name');

  String? get employerNameAndAddress => getField('Employer Name and Address');

  String? get employerStateIdNumberLine1 => getField('Employer State ID Number Line 1');

  String? get federalIncomeTaxWithheld => getField('Federal Income Tax Withheld');

  String? get formYear => getField('Form Year');

  String? get localIncomeTaxLine1 => getField('Local Income Tax Line 1');

  String? get localWagesAndTipsLine1 => getField('Local Wages and Tips Line 1');

  String? get localiyNameLine1 => getField('Locality Name Line 1');

  String? get medicareTaxWithheld => getField('Medicare Tax Withheld');

  String? get medicareWagesAndTips => getField('Medicare Wages and Tips');

  String? get nonqualifiedPlans => getField('Nonqualified Plans');

  String? get ssn => getField('SSN');

  String? get socialSecurityTips => getField('Social Security Tips');

  String? get socialSecurityWages => getField('Social Security Wages');

  String? get socialSecurityTaxWithheld => getField('Social Security Tax Withheld');

  String? get stateIncomeTaxLine1 => getField('State Income Tax Line 1');

  String? get stateWagesAndTipsLine1 => getField('State Wages and Tips Line 1');

  String? get stateLine1 => getField('State Line 1');

  String? get wagesTipsAndOtherCompensation => getField('Wages Tips and Other Compensation');

  factory W2.fromButlerResult(ButlerResult result) => W2.fromJson(result.toJson());

  factory W2.fromJson(Map<String, dynamic> json) => _$W2FromJson(json);

  Map<String, dynamic> toJson() => _$W2ToJson(this);
}