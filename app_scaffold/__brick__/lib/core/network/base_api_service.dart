import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/core/network/error_handler.dart';

abstract class BaseApiService {
  final Dio dio;

  BaseApiService(this.dio);

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters, options: options);
      return response.data as T;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.post(path, data: data, queryParameters: queryParameters, options: options);
      return response.data as T;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.put(path, data: data, queryParameters: queryParameters, options: options);
      return response.data as T;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.delete(path, data: data, queryParameters: queryParameters, options: options);
      return response.data as T;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<T> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.patch(path, data: data, queryParameters: queryParameters, options: options);
      return response.data as T;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<T> head<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.head(path, data: data, queryParameters: queryParameters, options: options);
      return response.data as T;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}

class BaseApiServiceImpl extends BaseApiService {
  BaseApiServiceImpl(super.dio);
}
