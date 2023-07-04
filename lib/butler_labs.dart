library butler_labs;

import 'package:butler_labs/models/butler_result.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';

class ButlerLabs {
  final String apiKey;

  ButlerLabs(this.apiKey);

  Future<ButlerResult?> performOcrOnImageFile(String path) async {
    // https://docs.butlerlabs.ai/reference/extract-document
    String butlerApiKey = const String.fromEnvironment('BUTLER_API_KEY');
    String queueId = const String.fromEnvironment('QUEUE_ID');

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
          path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
    } else {
      throw Exception('Platform not supported');
    }

    StreamedResponse response = await request.send();

    debugPrint('Response: ${response.statusCode}');
    debugPrint('Response: ${response.reasonPhrase}');
    debugPrint('Response: ${response.contentLength}');
    debugPrint('Response: ${response.request}');
    debugPrint('Response: ${response.stream}');
    debugPrint('Response: ${response.toString()}');

    String value = await response.stream.transform(utf8.decoder).join();
    result = ButlerResult.fromJson(jsonDecode(value));
    debugPrint('Response stream: $value');

    return result;
  }

  Future<ButlerResult?> performOcrOnImageBytes(Uint8List bytes) async {
    // https://docs.butlerlabs.ai/reference/extract-document
    String butlerApiKey = const String.fromEnvironment('BUTLER_API_KEY');
    String queueId = const String.fromEnvironment('QUEUE_ID');

    MultipartRequest request = MultipartRequest('POST', Uri.parse('https://app.butlerlabs.ai/api/queues/$queueId/documents'));

    ButlerResult? result;

    request.headers.addAll({
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.authorizationHeader: 'Bearer $butlerApiKey',
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    });

    MultipartFile file = MultipartFile(
      'file',
      ByteStream.fromBytes(bytes),
      bytes.lengthInBytes,
      filename: 'temp.jpg',
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(file);

    StreamedResponse response = await request.send();

    debugPrint('Response: ${response.statusCode}');
    debugPrint('Response: ${response.reasonPhrase}');
    debugPrint('Response: ${response.contentLength}');
    debugPrint('Response: ${response.request}');
    debugPrint('Response: ${response.stream}');
    debugPrint('Response: ${response.toString()}');

    String value = await response.stream.transform(utf8.decoder).join();
    result = ButlerResult.fromJson(jsonDecode(value));
    debugPrint('Response stream: $value');

    return result;
  }
}
