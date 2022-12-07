import 'package:graphql_flutter/graphql_flutter.dart';

class ApiRequestException implements Exception {
  final int statusCode;
  final String errorMessage;

  ApiRequestException(this.statusCode, this.errorMessage);

  @override
  String toString() {
    return """
    ApiRequestException: 
      statusCode = $statusCode
      errorMessage = $errorMessage
    """.trim();
  }
}

class ServerError implements Exception {}

class ImageCompressionException implements Exception {}

class ImageWatermarkException implements Exception {}



Future<void> collect<T>({
  required Future<void> Function() task,
  void Function(String)? onError,
  void Function(dynamic)? catchError,
}) async {
  try {
    await task();
  } on ApiRequestException catch(e) {
    if (onError != null && e.errorMessage.isNotEmpty) {
      onError(e.errorMessage);
    }
    if (catchError != null) {
      catchError(e);
    }
  } on ServerException catch(e) {
    if (onError != null) {
      onError("CommonLocalizer.serverError");
    }
    if (catchError != null) {
      catchError(e);
    }
  } catch(e) {
    if (onError != null) {
      onError("CommonLocalizer.unexpectedError");
    }
    if (catchError != null) {
      catchError(e);
    }
  }
}