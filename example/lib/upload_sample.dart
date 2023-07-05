import 'package:butler_labs/butler_labs.dart';
import 'package:butler_labs/models/butler_result.dart';
import 'package:example/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadSample extends StatefulWidget {
  const UploadSample({Key? key}) : super(key: key);

  @override
  State<UploadSample> createState() => _UploadSampleState();
}

class _UploadSampleState extends State<UploadSample> {

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

                          await ButlerLabs(const String.fromEnvironment('BUTLER_API_KEY')).uploadDocument(
                            documentBytes: imageBytes,
                            queueId: Model.driversLicense.queueId,
                          );


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
