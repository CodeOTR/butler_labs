import 'package:butler_labs/butler_labs.dart';
import 'package:butler_labs/models/butler_result.dart';
import 'package:example/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InsuranceCardSample extends StatefulWidget {
  const InsuranceCardSample({Key? key}) : super(key: key);

  @override
  State<InsuranceCardSample> createState() => _InsuranceCardSampleState();
}

class _InsuranceCardSampleState extends State<InsuranceCardSample> {
  ValueNotifier<DriversLicense?> license = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: license,
          builder: (context, value, child) {
            return Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                children: [
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
                        queueId: Model.driversLicense.queueId,
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
                  if (value != null) ...[
                    ListTile(
                      title: Text('Drivers License ID'),
                      subtitle: Text(value.documentNumber ?? 'N/A'),
                    )
                  ]
                ],
              ),
            );
          }),
    ));
  }
}
