// get post delete  put methode

// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/function/custom_exception.dart';
import 'package:ejary_cash/core/function/handle_exception.dart';
import 'package:ejary_cash/main.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Either<StatuesRequest, dynamic>> getData(
      String linkUrl, Map<String, String>? headers) async {
    final url = linkUrl;

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return right(data);
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 401) {
        log(response.body);
        throw UnauthorizedException();
      } else if (response.statusCode == 404) {
        log(response.body);
        return left(StatuesRequest.serverException);
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        return left(StatuesRequest.serverError);
      } else if (response.statusCode == 409) {
        throw ConflictException();
      } else {
        return left(StatuesRequest.defaultException);
      }
    } on SocketException {
      return left(StatuesRequest.socketException);
    } on http.ClientException {
      return left(StatuesRequest.clientException);
    } on TimeoutException {
      return left(StatuesRequest.timeoutException);
    } catch (e) {
      return left(handleException(e));
    }
  }

  Future<Either<StatuesRequest, dynamic>> postData(
      String linkUrl, Map<String, String>? headers, Map data) async {
    final url = linkUrl;

    final dataPost = jsonEncode(data);
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers, body: dataPost)
          .timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return right(data);
      } else if (response.statusCode == 422) {
        final data = jsonDecode(response.body);
        print(data);
        return left(StatuesRequest.unprocessableException);
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 401) {
        log(response.body);
        throw UnauthorizedException();
      } else if (response.statusCode == 404) {
        log(response.body);
        return left(StatuesRequest.serverException);
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        print(">>>>>  ${response.body}");
        final data = jsonDecode(response.body);
        String message = data['message'];
        print("APi >> $message");
        return right(message);
        //return left(StatuesRequest.serverError);
      } else if (response.statusCode == 409) {
        throw ConflictException();
      } else {
        print(response.statusCode);
        return left(StatuesRequest.defaultException);
      }
    } on SocketException {
      return left(StatuesRequest.socketException);
    } on http.ClientException {
      return left(StatuesRequest.clientException);
    } on TimeoutException {
      return left(StatuesRequest.timeoutException);
    } catch (e) {
      return left(handleException(e));
    }
  }

  Future<Either<StatuesRequest, dynamic>> updateData(
      String linkUrl, Map<String, String>? headers, Map data) async {
    final url = linkUrl;

    final dataPost = jsonEncode(data);
    try {
      final response = await http
          .put(Uri.parse(url), headers: headers, body: dataPost)
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return right(data);
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else if (response.statusCode == 404) {
        return left(StatuesRequest.serverException);
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        return left(StatuesRequest.serverError);
      } else if (response.statusCode == 409) {
        throw ConflictException();
      } else {
        return left(StatuesRequest.defaultException);
      }
    } on SocketException {
      return left(StatuesRequest.socketException);
    } on http.ClientException {
      return left(StatuesRequest.clientException);
    } on TimeoutException {
      return left(StatuesRequest.timeoutException);
    } catch (e) {
      return left(handleException(e));
    }
  }

  Future<Either<StatuesRequest, dynamic>> deleteData(
      String linkUrl, Map<String, String>? headers) async {
    final url = linkUrl;

    try {
      final response = await http
          .delete(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return right(data);
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else if (response.statusCode == 404) {
        return left(StatuesRequest.serverException);
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        return left(StatuesRequest.serverError);
      } else if (response.statusCode == 409) {
        throw ConflictException();
      } else {
        return left(StatuesRequest.defaultException);
      }
    } on SocketException {
      return left(StatuesRequest.socketException);
    } on http.ClientException {
      return left(StatuesRequest.clientException);
    } on TimeoutException {
      return left(StatuesRequest.timeoutException);
    } catch (e) {
      return left(handleException(e));
    }
  }

  Future<Either<StatuesRequest, dynamic>> postRequestwithfile(
    String url,
    Map data,
    List<File>? files,
    File? image,
    String token,
  ) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));

      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Accept'] = 'application/json';
      request.headers['Lang'] =
          sharedPreferences!.getString("local") == "ar" ? "ar" : "en";

      if (image != null) {
        log("Adding image...");
        var file =
            await http.MultipartFile.fromPath('product_image', image.path);
        request.files.add(file);
        log("Image path: ${image.path}");
      }

      if (files != null && files.isNotEmpty) {
        log("Adding documents...");
        for (var file in files) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'document[]',
              file.path,
            ),
          );
          log("Document path: ${file.path}");
        }
      }
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      log("Request files: ${request.files}");
      log("Request fields: ${request.fields}");

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseData);

      if (response.statusCode == 200) {
        print(jsonData);
        return right(jsonData);
      } else {
        print("Error: ${response.statusCode} - $jsonData");
        switch (response.statusCode) {
          case 400:
            throw BadRequestException();
          case 401:
            throw UnauthorizedException();
          case 403:
            throw ForbiddenException();
          case 404:
            return left(StatuesRequest.serverException);
          case 500:
            log(jsonData.toString());
            return left(StatuesRequest.serverError);
          case 409:
            throw ConflictException();
          default:
            log(jsonData.toString());
            return left(StatuesRequest.defaultException);
        }
      }
    } on SocketException {
      return left(StatuesRequest.socketException);
    } on http.ClientException {
      return left(StatuesRequest.clientException);
    } on TimeoutException {
      return left(StatuesRequest.timeoutException);
    } catch (e) {
      return left(handleException(e));
    }
  }
}
