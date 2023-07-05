import 'package:example/enhanced_extraction_sample.dart';
import 'package:example/general_sample.dart';
import 'package:example/upload_sample.dart';
import 'package:flutter/material.dart';

import 'insurance_card_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // InsuranceCardSample(),
      // GeneralSample(),
      // UploadSample(),
      // EnhancedExtractionSample(),
      home: const EnhancedExtractionSample(),
    );
  }
}

enum Model {
  driversLicense('d56b4379-3bef-4f50-9860-804f937a9700','fdf1f80a-03f5-40e5-83f0-a33694318532'),
  insuranceCard('18e633d6-698e-438e-8b1f-0470b142c4a5','c72b04bf-9d12-4f23-9e92-f5ec66468b9c');

  const Model(this.id,this.queueId);

  final String id;
  final String queueId;
}
