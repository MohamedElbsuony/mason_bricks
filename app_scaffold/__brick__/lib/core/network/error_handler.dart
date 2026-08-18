import 'package:dio/dio.dart';

class Failure {
  final int statusCode;
  final String message;

  const Failure({required this.statusCode, required this.message});

  @override
  String toString() => 'Failure(statusCode: $statusCode, message: $message)';
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler();

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleDioError(error);
    } else {
      failure = const Failure(
        statusCode: 500,
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const Failure(
          statusCode: 408,
          message: 'Connection timeout with server.',
        );
      case DioExceptionType.sendTimeout:
        return const Failure(
          statusCode: 408,
          message: 'Send timeout in connection with server.',
        );
      case DioExceptionType.receiveTimeout:
        return const Failure(
          statusCode: 408,
          message: 'Receive timeout in connection with server.',
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 500;
        final message = error.response?.data?['message']?.toString() ??
            'Received invalid response: $statusCode';
        return Failure(statusCode: statusCode, message: message);
      case DioExceptionType.cancel:
        return const Failure(
          statusCode: 499,
          message: 'Request to server was cancelled.',
        );
      case DioExceptionType.connectionError:
        return const Failure(
          statusCode: 503,
          message: 'No Internet connection.',
        );
      default:
        return const Failure(
          statusCode: 500,
          message: 'Something went wrong.',
        );
    }
  }
}
