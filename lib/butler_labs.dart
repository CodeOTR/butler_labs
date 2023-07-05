library butler_labs;

import 'dart:developer';

import 'package:butler_labs/models/butler_result.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';

class ButlerLabs {
  final String apiKey;

  static String baseUrl = 'https://app.butlerlabs.ai/api';

  ButlerLabs(this.apiKey);

  String get butlerApiKey => const String.fromEnvironment('BUTLER_API_KEY');

  /// Performs OCR on an image file and returns a [ButlerResult] object
  /// Note that images selected on web will not have a file path, so you should use [performOcrOnImageBytes] instead
  /// https://docs.butlerlabs.ai/reference/extract-document
  Future<ButlerResult?> performOcrOnImageFile({
    required String imagePath,
    required String queueId,
  }) async {
    MultipartRequest request = createButlerRequest(queueId: queueId);

    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      request.files.add(
        await MultipartFile.fromPath(
          'file',
          imagePath,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
    } else {
      throw Exception('Platform not supported');
    }

    StreamedResponse response = await request.send();

    ButlerResult? result;
    String value = await response.stream.transform(utf8.decoder).join();
    result = ButlerResult.fromJson(jsonDecode(value));
    debugPrint('Response stream: $value');

    return result;
  }

  /// Performs OCR on an image and returns a [ButlerResult] object
  /// This method will work on all platforms
  /// https://docs.butlerlabs.ai/reference/extract-document
  Future<ButlerResult?> performOcrOnImageBytes({
    required Uint8List imageBytes,
    required String queueId,
  }) async {
    MultipartRequest request = createButlerRequest(queueId: queueId);

    MultipartFile file = MultipartFile(
      'file',
      ByteStream.fromBytes(imageBytes),
      imageBytes.lengthInBytes,
      filename: 'temp.jpg',
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(file);

    StreamedResponse response = await request.send();

    ButlerResult? result;
    String value = await response.stream.transform(utf8.decoder).join();
    result = ButlerResult.fromJson(jsonDecode(value));
    log('Response stream: $value');

    return result;
  }

  /// Performs OCR on an image and returns a [Map<String, dynamic>] object
  /// This result from this method is meant to be used with the .fromJson() constructor
  /// on the specific model you are using (ex. DriversLicense, Passport, etc.)
  /// https://docs.butlerlabs.ai/reference/extract-document
  Future<Map<String, dynamic>?> performOcrOnImage({
    required Uint8List imageBytes,
    required String queueId,
  }) async {
    MultipartRequest request = createButlerRequest(queueId: queueId);

    MultipartFile file = MultipartFile(
      'file',
      ByteStream.fromBytes(imageBytes),
      imageBytes.lengthInBytes,
      filename: 'temp.jpg',
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(file);

    StreamedResponse response = await request.send();

    Map<String, dynamic>? result;
    String value = await response.stream.transform(utf8.decoder).join();
    result = jsonDecode(value);
    log('Response stream: $value');

    return result;
  }

  MultipartRequest createButlerRequest({required String queueId}) {
    MultipartRequest request = MultipartRequest('POST', Uri.parse('$baseUrl/queues/$queueId/documents'));

    request.headers.addAll({
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.authorizationHeader: 'Bearer $butlerApiKey',
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    });

    return request;
  }
}
