import 'package:example/license_sample.dart';
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
      // LicenseSample(),
      home: const InsuranceCardSample(),
    );
  }
}

enum Model {
  driversLicense('fdf1f80a-03f5-40e5-83f0-a33694318532'),
  insuranceCard('c72b04bf-9d12-4f23-9e92-f5ec66468b9c');

  const Model(this.id);

  final String id;
}
