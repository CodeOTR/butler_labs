import 'package:butler_labs/butler_labs.dart';
import 'package:butler_labs/models/butler_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueNotifier<XFile?> image = ValueNotifier<XFile?>(null);
  ValueNotifier<ButlerResult?> result = ValueNotifier<ButlerResult?>(null);

  String insuranceCardQueueId = 'c72b04bf-9d12-4f23-9e92-f5ec66468b9c';
  String driversLicenseQueueId = 'fdf1f80a-03f5-40e5-83f0-a33694318532';

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
                        ImagePicker picker = ImagePicker();

                        XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

                        if (pickedImage == null) return;

                        ButlerResult? output = await ButlerLabs(const String.fromEnvironment('BUTLER_API_KEY')).performOcrOnImageFile(
                          imagePath: pickedImage.path,
                          queueId: driversLicenseQueueId,
                        );

                        result.value = output;
                        image.value = pickedImage;
                      },
                      child: const Text('Upload Image'),
                    ),
                    if (val != null) ...[
                      ListTile(
                        title: Text('Document ID: ${val.documentId}'),
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
                          subtitle: Text('Value: ${field.value}'),
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
