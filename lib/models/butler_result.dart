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

  // todo get copays table
  // String? get copays => getField('Copays');

  factory InsuranceCard.fromButlerResult(ButlerResult result) => InsuranceCard.fromJson(result.toJson());

  factory InsuranceCard.fromJson(Map<String, dynamic> json) => _$InsuranceCardFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceCardToJson(this);
}

/// https://docs.butlerlabs.ai/reference/id-card-ocr
@JsonSerializable(explicitToJson: true)
class IdCard extends ButlerResult {
  IdCard();

  /// Given name and middle name if applicable
  String? get firstName => getField('First Name');

  /// Middle name (if applicable) for this ID Card
  String? get middleName => getField('Middle Name');

  /// Surname for this ID Card
  String? get lastName => getField('Last Name');

  /// Suffix (if applicable) for this ID Card. Relevant for: Driver's License & State ID Cards
  String? get suffix => getField('Suffix');

  /// Document Number for this ID Card
  String? get documentNumber => getField('Document Number');

  /// The type of this ID Card. For example Passport or Driver's License
  String? get type => getField('Type');

  /// The class of this ID Card. Relevant for: Driver's License & State ID Cards
  String? get classCode => getField('Class');

  /// Issue date for this ID Card
  String? get issueDate => getField('Issue Date');

  /// Expiration date for this ID Card
  String? get expirationDate => getField('Expiration Date');

  /// Birth date for this ID Card
  String? get dateOfBirth => getField('Date of Birth');

  /// Full address for this ID Card. Relevant for: Driver's License & State ID Cards
  String? get address => getField('Address');

  /// City portion of the address for this ID Card. Relevant for: Driver's License & State ID Cards
  String? get addressCity => getField('Address City');

  /// Zip Code portion of the address for this ID Card. Relevant for: Driver's License & State ID Cards
  String? get addressZipCode => getField('Address Zip Code');

  /// Shorthand State portion of the address for this ID Card. Relevant for: Driver's License & State ID Cards
  String? get addressState => getField('Address State');

  /// State this ID Card was issued in. Relevant for: Driver's License & State ID Cards
  String? get state => getField('State');

  /// County this ID Card was issued in. Relevant for: Driver's License & State ID Cards
  String? get county => getField('County');

  /// Place of Birth for this ID Card. Relevant for: Passports
  String? get placeOfBirth => getField('Place of Birth');

  /// Restrictions listed on this ID Card. Relevant for: Driver's License & State ID Cards
  String? get restrictions => getField('Restrictions');

  /// Endorsements listed on this ID Card. Relevant for: Driver's License & State ID Cards
  String? get endorsements => getField('Endorsements');

  /// Veteran status listed on this ID Card. Relevant for: Driver's License & State ID Cards
  String? get veteran => getField('Veteran');

  factory IdCard.fromButlerResult(ButlerResult result) => IdCard.fromJson(result.toJson());

  factory IdCard.fromJson(Map<String, dynamic> json) => _$IdCardFromJson(json);

  Map<String, dynamic> toJson() => _$IdCardToJson(this);
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
  String? get nationality => getField('Nationality');

  /// Extracted Machine Readable Zone including two lines of 44 characters each
  String? get machineReadableZone => getField('Machine Readable Zone');

  factory Passport.fromButlerResult(ButlerResult result) => Passport.fromJson(result.toJson());

  factory Passport.fromJson(Map<String, dynamic> json) => _$PassportFromJson(json);

  Map<String, dynamic> toJson() => _$PassportToJson(this);
}

/// https://docs.butlerlabs.ai/reference/mortgage-ocr
@JsonSerializable(explicitToJson: true)
class Mortgage extends ButlerResult {
  Mortgage();

  /// The Borrower's Address for this Mortgage Statement
  String? get borrowerAddress => getField('Borrower Address');

  /// The name of the First Borrower for this Mortgage Statement
  String? get borrowerName1 => getField('Borrower Name 1');

  /// The name of the Second Borrower for this Mortgage Statement
  String? get borrowerName2 => getField('Borrower Name 2');

  /// The Due Date for this Mortgage Statement
  String? get dueDate => getField('Due Date');

  /// The Fees Due for this Mortgage Statement
  String? get feesDue => getField('Fees Due');

  /// The Frequency of Payments for this Mortgage Statement
  String? get frequency => getField('Frequency');

  /// The Amount of Insurance Escrow Due for this Mortgage Statement
  String? get insuranceEscrowDue => getField('Insurance Escrow Due');

  /// The Amount of Interest Due for this Mortgage Statement
  String? get interestDue => getField('Interest Due');

  /// The Interest Rate for this Mortgage Statement
  String? get interestRate => getField('Interest Rate');

  /// The Loan Number for this Mortgage Statement
  String? get loanNumber => getField('Loan Number');

  /// The Type of Loan for this Mortgage Statement
  String? get loanType => getField('Loan Type');

  /// The Maturity Date for this Mortgage Statement
  String? get maturityDate => getField('Maturity Date');

  /// The Others Due for this Mortgage Statement
  String? get othersDue => getField('Others Due');

  /// The Past Due Amount for this Mortgage Statement
  String? get pastDueAmount => getField('Past Due Amount');

  /// The Principal Balance for this Mortgage Statement
  String? get principalBalance => getField('Principal Balance');

  /// The Principal Due for this Mortgage Statement
  String? get principalDue => getField('Principal Due');

  /// The Principal Address for this Mortgage Statement
  String? get propertyAddress => getField('Property Address');

  /// The Regular Payment Amount for this Mortgage Statement
  String? get regularPaymentAmount => getField('Regular Payment Amount');

  /// The Servicer Address for this Mortgage Statement
  String? get servicerAddress => getField('Servicer Address');

  /// The Servicer Name for this Mortgage Statement
  String? get servicerName => getField('Servicer Name');

  /// The Date of this Mortgage Statement
  String? get statementDate => getField('Statement Date');

  /// The Tax Escrow Due for this Mortgage Statement
  String? get taxEscrowDue => getField('Tax Escrow Due');

  /// The Total Due for this Mortgage Statement
  String? get totalDue => getField('Total Due');

  /// The Total Escrow Due for this Mortgage Statement
  String? get totalEscrowDue => getField('Total Escrow Due');

  /// The Description of this transaction
  String? get description => getField('Description');

  /// The Effective Date of this transaction
  String? get effectiveDate => getField('Effective Date');

  /// The Escrow Amount for this transaction
  String? get escrowAmount => getField('Escrow Amount');

  /// The Fees Amount for this transaction
  String? get feesAmount => getField('Fees Amount');

  /// The Interest Amount for this transaction
  String? get interestAmount => getField('Interest Amount');

  /// The Others Amount for this transaction
  String? get othersAmount => getField('Others Amount');

  /// The Principal Amount for this transaction
  String? get principalAmount => getField('Principal Amount');

  /// The Total Amount for this transaction
  String? get totalAmount => getField('Total Amount');

  /// The Total Amount Charged for this transaction
  String? get totalCharged => getField('Total Charged');

  /// The Total Amount Paid for this transaction
  String? get totalPaid => getField('Total Paid');

  /// The Date of this transaction
  String? get transactionDate => getField('Transaction Date');

  /// The Unapplied Amount for this transaction
  String? get unappliedAmount => getField('Unapplied Amount');

  factory Mortgage.fromButlerResult(ButlerResult result) => Mortgage.fromJson(result.toJson());

  factory Mortgage.fromJson(Map<String, dynamic> json) => _$MortgageFromJson(json);

  Map<String, dynamic> toJson() => _$MortgageToJson(this);
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

  /// Employer Identification Number for this W2
  String? get ein => getField('EIN');

  /// The Employee Address for this W2
  String? get employeeAddress => getField('Employee Address');

  /// The Employee Name for this W2
  String? get employeeName => getField('Employee Name');

  /// The Employer Name and Address for this W2
  String? get employerNameAndAddress => getField('Employer Name and Address');

  /// The first line of the Employer State ID Number for this W2
  String? get employerStateIdNumberLine1 => getField('Employer State ID Number Line 1');

  /// The Federal Income Tax Witheld for this W2
  String? get federalIncomeTaxWithheld => getField('Federal Income Tax Withheld');

  /// The year for this W2
  String? get formYear => getField('Form Year');

  /// The first line of the Local Income Tax for this W2
  String? get localIncomeTaxLine1 => getField('Local Income Tax Line 1');

  /// The first line of the Local Wages and Tips for this W2
  String? get localWagesAndTipsLine1 => getField('Local Wages and Tips Line 1');

  /// The first line of the Locality Name for this W2
  String? get localityNameLine1 => getField('Locality Name Line 1');

  /// The Medicare Tax Withheld for this W2
  String? get medicareTaxWithheld => getField('Medicare Tax Withheld');

  /// The Medicare Wages and Tips for this W2
  String? get medicareWagesAndTips => getField('Medicare Wages and Tips');

  /// The Nonqualified Plans for this W2
  String? get nonqualifiedPlans => getField('Nonqualified Plans');

  /// The Social Security Number of the employee for this W2
  String? get ssn => getField('SSN');

  /// The Social Security Tax Withheld for this W2
  String? get socialSecurityTips => getField('Social Security Tips');

  /// The Social Security Tips for this W2
  String? get socialSecurityWages => getField('Social Security Wages');

  /// The Social Security Wages for this W2
  String? get socialSecurityTaxWithheld => getField('Social Security Tax Withheld');

  /// The first line of the State Income Tax for this W2
  String? get stateIncomeTaxLine1 => getField('State Income Tax Line 1');

  /// The first line of the State Wages and Tips for this W2
  String? get stateWagesAndTipsLine1 => getField('State Wages and Tips Line 1');

  /// The first line of the State for this W2
  String? get stateLine1 => getField('State Line 1');

  /// The Wages, Tips and Other Compensation for this W2
  String? get wagesTipsAndOtherCompensation => getField('Wages Tips and Other Compensation');

  factory W2.fromButlerResult(ButlerResult result) => W2.fromJson(result.toJson());

  factory W2.fromJson(Map<String, dynamic> json) => _$W2FromJson(json);

  Map<String, dynamic> toJson() => _$W2ToJson(this);
}

/// https://docs.butlerlabs.ai/reference/invoice-ocr
@JsonSerializable(explicitToJson: true)
class Invoice extends ButlerResult {
  Invoice();

  String? get invoiceNumber => getField('Invoice Number');

  String? get invoiceDate => getField('Invoice Date');

  String? get dueDate => getField('Due Date');

  String? get purchaseOrder => getField('Purchase Order');

  String? get customerId => getField('Customer ID');

  String? get customerTaxId => getField('Customer Tax ID');

  String? get customerName => getField('Customer Name');

  String? get customerAddress => getField('Customer Address');

  String? get customerAddressRecipient => getField('Customer Address Recipient');

  String? get billingAddresRecipient => getField('Billing Address Recipient');

  String? get billingAddress => getField('Billing Address');

  String? get shippingAddressRecipient => getField('Shipping Address Recipient');

  String? get shippingAddress => getField('Shipping Address');

  String? get remittanceAddressRecipient => getField('Remittance Address Recipient');

  String? get remittanceAddress => getField('Remittance Address');

  String? get serviceAddressRecipient => getField('Service Address Recipient');

  String? get serviceAddress => getField('Service Address');

  String? get serviceStartDate => getField('Service Start Date');

  String? get serviceEndDate => getField('Service End Date');

  String? get vendorName => getField('Vendor Name');

  String? get vendorTaxId => getField('Vendor Tax ID');

  String? get vendorAddressRecipient => getField('Vendor Address Recipient');

  String? get vendorAddress => getField('Vendor Address');

  String? get paymentTerm => getField('Payment Term');

  String? get previousUnpaidBalance => getField('Previous Unpaid Balance');

  String? get subtotal => getField('Subtotal');

  String? get totalTax => getField('Total Tax');

  String? get totalVat => getField('Total VAT');

  String? get amountDue => getField('Amount Due');

  String? get invoiceTotal => getField('Invoice Total');

  // Todo get table
  // String? get lineItems => getField('Line Items');

  factory Invoice.fromButlerResult(ButlerResult result) => Invoice.fromJson(result.toJson());

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
