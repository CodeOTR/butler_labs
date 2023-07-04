
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: result,
          builder: (context, val, child) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ElevatedButton(
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();

                    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

                    if (pickedImage == null) return;

                    image.value = pickedImage;
                    debugPrint('pickedImage: ' + pickedImage.path);


                  },
                  child: const Text('Upload Image'),
                ),
                if(val != null)...[
                  ListTile(
                    title: Text('Document ID: ${val.documentId}'),
                  ),
                  ListTile(
                    title: Text('Document Status: ${val.documentStatus}'),
                  ),
                  ListTile(
                    title: Text('Document Type: ${val.documentType}'),
                  ),
                  ...val.formFields.map((field) {
                    return ListTile(
                      title: Text('Field: ${field.fieldName}'),
                      subtitle: Text('Value: ${field.value}'),
                    );
                  }).toList(),
                ]
              ],
            );
          }
      ),
    );
  }
}