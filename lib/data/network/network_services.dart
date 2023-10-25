import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instragram_clone/data/network/base_api_services.dart';
import 'package:instragram_clone/data/response/app_exception.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data,
      {Map<String, String>? header}) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(data),
            headers: header,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      debugPrint(responseJson.toString());
      throw FetchDataException(" No Internet Connection");
    }
    return responseJson;
  }

  Future getPostApiResponseWithHeader(
      String url, dynamic data, dynamic header) async {
    dynamic responseJson;

    try {
      final response =
          await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
        'Authorization': 'Basic c29jaWFsTWVkaWE6c29jaWFsQDEyMw==',
        'Content-Type': 'application/json; charset=UTF-8'
      }).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    final responseJson = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 400:
        debugPrint(responseJson.toString());
        throw BadRequestException(responseJson['error'] ?? 'Bad Request');
      case 401:
        debugPrint(responseJson.toString());

        throw UnauthorisedException(responseJson['error'] ?? 'Unauthorized');
      case 404:
        debugPrint(responseJson.toString());
        throw NotFoundException(responseJson['error'] ?? 'NotFoundException');

      default:
        debugPrint(responseJson.toString());
        throw FetchDataException(
            'Error occurred while communicating with the server with status code ${response.toString()}');
    }
  }
}
