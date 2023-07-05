import 'package:butler_labs/butler_labs.dart';
import 'package:butler_labs/models/butler_result.dart';
import 'package:example/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LicenseSample extends StatefulWidget {
  const LicenseSample({Key? key}) : super(key: key);

  @override
  State<LicenseSample> createState() => _HomeState();
}

class _HomeState extends State<LicenseSample> {
  ValueNotifier<XFile?> image = ValueNotifier<XFile?>(null);
  ValueNotifier<ButlerResult?> result = ValueNotifier<ButlerResult?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: result,
            builder: (context, val, child) {
              return Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        result.value = null;
                        image.value = null;
                        ImagePicker picker = ImagePicker();

                        XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

                        if (pickedImage == null) return;

                        Uint8List imageBytes = await pickedImage.readAsBytes();
                        ButlerResult? output = await ButlerLabs(const String.fromEnvironment('BUTLER_API_KEY')).performOcrOnImageBytes(
                          imageBytes: imageBytes,
                          queueId: Model.driversLicense.id,
                        );

                        result.value = output;
                        image.value = pickedImage;
                      },
                      child: const Text('Upload Image Bytes'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        result.value = null;
                        image.value = null;
                        ImagePicker picker = ImagePicker();

                        XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

                        if (pickedImage == null) return;

                        ButlerResult? output = await ButlerLabs(const String.fromEnvironment('BUTLER_API_KEY')).performOcrOnImageFile(
                          imagePath: pickedImage.path,
                          queueId: Model.driversLicense.id,
                        );

                        result.value = output;
                        image.value = pickedImage;
                      },
                      child: const Text('Upload Image Path'),
                    ),
                    if (val != null) ...[
                      ListTile(
                        title: Text('Document ID: ${val.documentId}'),
                      ),
                      ListTile(
                        title: Text('Upload ID: ${val.uploadId}'),
                      ),
                      ListTile(
                        title: Text('Document Status: ${val.documentStatus}'),
                      ),
                      ListTile(
                        title: Text('Document Type: ${val.documentType}'),
                      ),
                      ...(val.formFields ?? []).map((field) {
                        return ListTile(
                          title: Text('Field: ${field.fieldName}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Value: ${field.value}'),
                              LinearProgressIndicator(
                                value: field.confidenceValue,
                                color: field.confidenceScore == 'Low'
                                    ? Colors.red
                                    : field.confidenceScore == 'Medium'
                                    ? Colors.yellow
                                    : Colors.green,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ]
                  ],
                ),
              );
            }),
      ),
    );
  }
}