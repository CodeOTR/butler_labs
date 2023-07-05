import 'package:butler_labs/butler_labs.dart';
import 'package:butler_labs/models/butler_result.dart';
import 'package:example/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EnhancedExtractionSample extends StatefulWidget {
  const EnhancedExtractionSample({Key? key}) : super(key: key);

  @override
  State<EnhancedExtractionSample> createState() => _EnhancedExtractionSampleState();
}

class _EnhancedExtractionSampleState extends State<EnhancedExtractionSample> {
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
                      await ButlerLabs(const String.fromEnvironment('BUTLER_API_KEY')).enhancedExtract(
                        documentId: '31d936d5-9356-4c08-8a1a-3c127bb6638f',
                        modelId: Model.driversLicense.id,
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
