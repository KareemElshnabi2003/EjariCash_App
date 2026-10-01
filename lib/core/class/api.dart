import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ejary_cash/core/class/api_failure.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/function/handle_exception.dart';
import 'package:ejary_cash/main.dart';
import 'package:http/http.dart' as http;

class Api {
  static const Duration defaultTimeout = Duration(seconds: 20);

  Uri _buildUri(String url, [Map<String, dynamic>? queryParameters]) {
    final parsed = Uri.parse(url);
    if (queryParameters == null || queryParameters.isEmpty) {
      return parsed;
    }
    final params = Map<String, dynamic>.from(parsed.queryParameters);
    queryParameters.forEach((key, value) {
      if (value != null && value.toString().trim().isNotEmpty) {
        params[key] = value.toString();
      }
    });
    return parsed.replace(
      queryParameters: params.map((k, v) => MapEntry(k, v.toString())),
    );
  }

  Either<ApiFailure, dynamic> _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final isSuccess = statusCode >= 200 && statusCode < 300;

    // Handle 204 No Content or empty body
    if (statusCode == 204 || response.body.trim().isEmpty) {
      if (isSuccess) {
        return right(<String, dynamic>{'status': true, 'data': null});
      }
    }

    dynamic parsedBody;
    try {
      parsedBody = response.body.trim().isEmpty ? null : jsonDecode(response.body);
    } catch (_) {
      parsedBody = response.body;
    }

    if (isSuccess) {
      return right(parsedBody ?? <String, dynamic>{'status': true});
    }

    // Extract message safely from error body
    String message = '';
    if (parsedBody is Map) {
      message = parsedBody['message']?.toString() ??
          parsedBody['error']?.toString() ??
          parsedBody['errors']?.toString() ??
          '';
    } else if (parsedBody is String) {
      message = parsedBody;
    }

    switch (statusCode) {
      case 400:
        return left(ApiFailure(
          status: StatuesRequest.badRequestException,
          statusCode: statusCode,
          message: message.isNotEmpty ? message : 'Bad request',
          data: parsedBody,
        ));
      case 401:
        return left(ApiFailure(
          status: StatuesRequest.unauthorizedException,
          statusCode: statusCode,
          message: message.isNotEmpty ? message : 'Unauthorized',
          data: parsedBody,
        ));
      case 403:
        return left(ApiFailure(
          status: StatuesRequest.forbiddenException,
          statusCode: statusCode,
          message: message.isNotEmpty ? message : 'Forbidden',
          data: parsedBody,
        ));
      case 404:
        return left(ApiFailure(
          status: StatuesRequest.serverException,
          statusCode: statusCode,
          message: message.isNotEmpty ? message : 'Resource not found',
          data: parsedBody,
        ));
      case 409:
        return left(ApiFailure(
          status: StatuesRequest.conflictException,
          statusCode: statusCode,
          message: message.isNotEmpty ? message : 'Conflict occurred',
          data: parsedBody,
        ));
      case 422:
        return left(ApiFailure(
          status: StatuesRequest.unprocessableException,
          statusCode: statusCode,
          message: message.isNotEmpty ? message : 'Unprocessable entity',
          data: parsedBody,
        ));
      case 500:
      case 502:
      case 503:
        return left(ApiFailure(
          status: StatuesRequest.serverError,
          statusCode: statusCode,
          message: message.isNotEmpty ? message : 'Internal server error',
          data: parsedBody,
        ));
      default:
        return left(ApiFailure(
          status: StatuesRequest.defaultException,
          statusCode: statusCode,
          message: message.isNotEmpty
              ? message
              : 'Request failed with status $statusCode',
          data: parsedBody,
        ));
    }
  }

  Future<Either<ApiFailure, dynamic>> _executeRequest(
    Future<http.Response> Function() requestFn,
  ) async {
    try {
      final response = await requestFn().timeout(defaultTimeout);
      return _processResponse(response);
    } on SocketException {
      return left(const ApiFailure(
        status: StatuesRequest.socketException,
        message: 'No internet connection',
      ));
    } on http.ClientException catch (e) {
      return left(ApiFailure(
        status: StatuesRequest.clientException,
        message: e.message,
      ));
    } on TimeoutException {
      return left(const ApiFailure(
        status: StatuesRequest.timeoutException,
        message: 'Request timeout',
      ));
    } on FormatException catch (e) {
      return left(ApiFailure(
        status: StatuesRequest.formatException,
        message: e.message,
      ));
    } catch (e) {
      return left(ApiFailure(
        status: handleException(e),
        message: e.toString(),
      ));
    }
  }

  Future<Either<ApiFailure, dynamic>> getData(
    String linkUrl,
    Map<String, String>? headers, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(linkUrl, queryParameters);
    return _executeRequest(() => http.get(uri, headers: headers));
  }

  Future<Either<ApiFailure, dynamic>> postData(
    String linkUrl,
    Map<String, String>? headers,
    Map data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(linkUrl, queryParameters);
    final dataPost = jsonEncode(data);
    return _executeRequest(
      () => http.post(uri, headers: headers, body: dataPost),
    );
  }

  Future<Either<ApiFailure, dynamic>> updateData(
    String linkUrl,
    Map<String, String>? headers,
    Map data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(linkUrl, queryParameters);
    final dataPost = jsonEncode(data);
    return _executeRequest(
      () => http.put(uri, headers: headers, body: dataPost),
    );
  }

  Future<Either<ApiFailure, dynamic>> deleteData(
    String linkUrl,
    Map<String, String>? headers, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _buildUri(linkUrl, queryParameters);
    return _executeRequest(() => http.delete(uri, headers: headers));
  }

  Future<Either<ApiFailure, dynamic>> postRequestwithfile(
    String url,
    Map data,
    List<File>? files,
    File? image,
    String token,
  ) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest("POST", uri);

      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Accept'] = 'application/json';
      final lang =
          sharedPreferences?.getString("local") == "ar" ? "ar" : "en";
      request.headers['Lang'] = lang;

      if (image != null && await image.exists()) {
        final file =
            await http.MultipartFile.fromPath('product_image', image.path);
        request.files.add(file);
      }

      if (files != null && files.isNotEmpty) {
        for (var file in files) {
          if (await file.exists()) {
            request.files.add(
              await http.MultipartFile.fromPath('document[]', file.path),
            );
          }
        }
      }

      data.forEach((key, value) {
        if (value == null) return;
        if (value is Iterable) {
          final list = value.toList();
          final baseKey = key.toString().endsWith('[]')
              ? key.toString().substring(0, key.toString().length - 2)
              : key.toString();
          for (var i = 0; i < list.length; i++) {
            request.fields['$baseKey[$i]'] = list[i].toString();
          }
        } else {
          request.fields[key.toString()] = value.toString();
        }
      });

      final streamedResponse = await request.send().timeout(defaultTimeout);
      final response = await http.Response.fromStream(streamedResponse);
      return _processResponse(response);
    } on SocketException {
      return left(const ApiFailure(
        status: StatuesRequest.socketException,
        message: 'No internet connection',
      ));
    } on http.ClientException catch (e) {
      return left(ApiFailure(
        status: StatuesRequest.clientException,
        message: e.message,
      ));
    } on TimeoutException {
      return left(const ApiFailure(
        status: StatuesRequest.timeoutException,
        message: 'Request timeout',
      ));
    } catch (e) {
      return left(ApiFailure(
        status: handleException(e),
        message: e.toString(),
      ));
    }
  }
}
