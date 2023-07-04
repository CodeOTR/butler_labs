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

  ButlerLabs(this.apiKey);

  String get butlerApiKey => const String.fromEnvironment('BUTLER_API_KEY');

  /// Performs OCR on an image file and returns a [ButlerResult] object
  /// Note that images selected on web will not have a file path, so you should use [performOcrOnImageBytes] instead
  /// https://docs.butlerlabs.ai/reference/extract-document
  Future<ButlerResult?> performOcrOnImageFile({
    required String imagePath,
    required String queueId,
  }) async {

    MultipartRequest request = MultipartRequest('POST', Uri.parse('https://app.butlerlabs.ai/api/queues/$queueId/documents'));

    ButlerResult? result;

    request.headers.addAll({
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.authorizationHeader: 'Bearer $butlerApiKey',
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    });

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

    MultipartRequest request = MultipartRequest('POST', Uri.parse('https://app.butlerlabs.ai/api/queues/$queueId/documents'));

    ButlerResult? result;

    request.headers.addAll({
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.authorizationHeader: 'Bearer $butlerApiKey',
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    });

    MultipartFile file = MultipartFile(
      'file',
      ByteStream.fromBytes(imageBytes),
      imageBytes.lengthInBytes,
      filename: 'temp.jpg',
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(file);

    StreamedResponse response = await request.send();

    String value = await response.stream.transform(utf8.decoder).join();
    result = ButlerResult.fromJson(jsonDecode(value));
    log('Response stream: $value');

    return result;
  }
}
