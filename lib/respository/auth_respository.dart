import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:instragram_clone/data/network/base_api_services.dart';
import 'package:instragram_clone/data/network/network_services.dart';
import 'package:instragram_clone/res/component/app_url.dart';
import 'package:instragram_clone/respository/shared_perfrence.dart';

//import 'package:flutter_application_1/res/component/app_url.dart';
class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  //late String resetToken;

  //***************************************SingupApi*********************************************//
  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic header = {"NAME": "socialMedia", "PASS": "social@123"};
      dynamic response = await NetworkApiService()
          .getPostApiResponseWithHeader(AppUrl.signupapi, data, header);
      return response;
      //print('')
    } catch (e) {
      rethrow;
    }
  }

  //***************************************VerifyOtpApi*********************************************//
  Future<bool> verifyOtpApi(dynamic data) async {
    try {
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.verifyOtpApi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});
      debugPrint(response.toString());
      if (response['statusCode'] == 200) {
        return true;
      }

      return false;
    } catch (e) {
      rethrow;
    }
  }
 

  //***************************************ResendOtpApi*********************************************//
  Future<void> resendOtpApi(dynamic data) async {
    // Replace 'AppUrl.resendOtpApi' with your actual OTP resend API endpoint
    await _apiServices.getPostApiResponse(AppUrl.resendOtpApi, data,
        header: {"Content-Type": "application/json; charset=UTF-8"});
  }

  //***************************************LoginApi*********************************************//

  Future<dynamic> loginapi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.loginapi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});

      if (response is Map<String, dynamic>) {
        // If the response is already a Map, no need to parse it
        final String accessToken = response['data']['accessToken'];
        debugPrint(response.toString());
        debugPrint("--------------------------");
        SharedPreferencesManager.saveLoginToken(accessToken);
        String? loginToken = await SharedPreferencesManager.getLoginToken();
        // debugPrint(accessToken.toString());
        debugPrint("------***************----************---------------");
        debugPrint(loginToken);

        return response;
      } else {
        // debugPrint(response.toString());
        // final String accessToken = response['data']['accessToken'];
        // debugPrint(response.toString());
        // debugPrint("--------------------------");
        // debugPrint(accessToken.toString());
        // Handle other response types if necessary
        throw Exception("Unexpected response type");
      }
    } catch (e) {
      rethrow;
    }
  }

  //***************************************ForgetPasswordApi*********************************************//
  Future<void> forgetPasswordApi(dynamic data) async {
    // Replace 'AppUrl.resendOtpApi' with your actual OTP resend API endpoint
    await _apiServices.getPostApiResponse(AppUrl.forgetpassword, data,
        header: {"Content-Type": "application/json; charset=UTF-8"});
  }

  //***************************************VerifyOtpApi*********************************************//

 
  Future<bool> verifyOtpApiforget(dynamic data) async {
    try {
      // Replace 'AppUrl.verifyOtpApi' with your actual OTP verification API endpoint
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.forgetotpapi, data,
          header: {"Content-Type": "application/json; charset=UTF-8"});
      debugPrint(response.toString());
      if (response['statusCode'] == 200) {
        final String resetPasswordToken =
            response['data']['resetPasswordToken'];
        debugPrint("-----nvdonbvoidsobijjbo---------------");
        debugPrint('Reset Password Token: $resetPasswordToken');
        SharedPreferencesManager.saveResetPasswordToken(resetPasswordToken);
        String resetToken =
            (await SharedPreferencesManager.getResetPasswordToken())!;
        // debugPrint(accessToken.toString());
        debugPrint("------***************----************---------------");
        debugPrint(resetToken);

        return true;
      }

      return false;
    } catch (e) {
      rethrow;
    }
  }

  //***************************************ResetPasswordApi*********************************************//
 
  Future<dynamic> resetPasswordApi(
    dynamic data,
  ) async {
    String? authToken = await SharedPreferencesManager.getResetPasswordToken();
    debugPrint("@@@@@@@@@@@@@@@@@@@@@@@!&&&&&&&&&&&&&&&&&&&&&&&&");
    debugPrint(authToken.toString());
    debugPrint("dfghjkldfghjkcvhbjkffghjkcfghj");
    debugPrint("Requesting password reset API with token: $authToken");
    debugPrint("Request Data: $data");
    try {
      dynamic response = await _apiServices.getPostApiResponse(
        AppUrl.resetPasswordApi,
        data,
        header: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer $authToken",
        },
      );
    } catch (e) {
      //print(Response);
      debugPrint("Error during API call: $e");
      rethrow;
    }
  }
    //***************************************LogoutApi*********************************************//
    Future<void> logoutApi(String? authToken) async {
       String? authToken = await SharedPreferencesManager.getLoginToken();
    try {
      // Call your logout API endpoint here, passing the Bearer token in the header
      await _apiServices.getPostApiResponse(
        AppUrl.logout, // Replace with your logout API endpoint
        null,
        header: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer $authToken",
        },
      );
    } catch (error) {
      // Handle error if needed
      print("Error during logout API call: $error");
      rethrow;
    }
  }

}
