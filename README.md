# Butler Labs OCR
 A Pure Dart SDK for [Butler Labs OCR](https://www.butlerlabs.ai/).

## Supported Models
✅ [US Driver's License](https://docs.butlerlabs.ai/reference/us-drivers-license-ocr)

✅ [Passport](https://docs.butlerlabs.ai/reference/passport-ocr)

✅ [Receipt](https://docs.butlerlabs.ai/reference/receipt-ocr)

✅ [Invoice](https://docs.butlerlabs.ai/reference/invoice-ocr)

✅ [ID Card](https://docs.butlerlabs.ai/reference/id-card-ocr)

✅ [W2](https://docs.butlerlabs.ai/reference/w2-ocr)

✅ [W9](https://docs.butlerlabs.ai/reference/w9-ocr)

✅ [Mortgage](https://docs.butlerlabs.ai/reference/mortgage-ocr)

✅ [Health Insurance Card](https://docs.butlerlabs.ai/reference/health-insurance-card-ocr)

✅ [Paystub](https://docs.butlerlabs.ai/reference/paystub-ocr)


> Tables are not supported yet

## Supported Endpoints
✅ [Extract Document](https://docs.butlerlabs.ai/reference/extract-document)

✅ [Get Enhanced Extraction Results](https://docs.butlerlabs.ai/reference/get-enhanced-extraction-results)   

🔲 [Upload Documents](https://docs.butlerlabs.ai/reference/upload-documents-queues)

🔲 [Get Extraction Results](https://docs.butlerlabs.ai/reference/get-extracted-results-queues)

🔲 [Delete Upload](https://docs.butlerlabs.ai/reference/delete-upload)

🔲 [Create Model](https://docs.butlerlabs.ai/reference/create-model)

🔲 [Get Model Info](https://docs.butlerlabs.ai/reference/get-model-info)

🔲 [Train Model](https://docs.butlerlabs.ai/reference/train-model)

🔲 [Update Labels for a Document](https://docs.butlerlabs.ai/reference/update-labels-for-a-document)

🔲 [Get Bank Statement Results](https://docs.butlerlabs.ai/reference/get-bank-statement-results)

# Usage
See [blog post](https://codeontherocks.dev/blog/butler-ai-ocr-flutter/) for setup and usage instructions.
```dart
ElevatedButton(
  onPressed: () async {
    license.value = null;
    ImagePicker picker = ImagePicker();

    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    Uint8List imageBytes = await pickedImage.readAsBytes();

    // You can use the ButlerResult class
    ButlerResult? output = await ButlerLabs(const String.fromEnvironment('BUTLER_API_KEY')).performOcrOnImageBytes(
      imageBytes: imageBytes,
      queueId: Model.driversLicense.id,
    );

    if (output != null) {
      license.value = DriversLicense.fromButlerResult(output);
    }

    // Or you can use the map method
    /*Map<String, dynamic>? output = await ButlerLabs(const String.fromEnvironment('BUTLER_API_KEY')).performOcrOnImage(
      imageBytes: imageBytes,
      queueId: Model.driversLicense.id,
    );

    if (output != null) {
      license.value = DriversLicense.fromJson(output);
    }*/
  },
  child: const Text('Upload Image'),
),
```