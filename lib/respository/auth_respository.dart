import 'dart:convert';
import 'package:instragram_clone/data/network/base_api_services.dart';
import 'package:instragram_clone/data/network/network_services.dart';
import 'package:instragram_clone/res/component/app_url.dart';

//import 'package:flutter_application_1/res/component/app_url.dart';
class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

 //***************************************SingupApi*********************************************//
  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic header = {"NAME": "socailMedia", "PASS": "social@123"};
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

      // Assuming your API response contains a key 'isValid' indicating whether the OTP is valid or not
      bool isValid = response['isValid'] ?? true;

      

      return isValid;
    } catch (e) {
      // Handle errors here, such as network issues or server errors
      // You can log the error or throw it back to the calling function
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
 // dynamic header=
 dynamic response = await _apiServices.getPostApiResponse(
 AppUrl.loginapi, data,
 header: {"Content-Type": "application/json; charset=UTF-8"});

 if (response is String) {
 // If the response is a JSON string, parse it
 Map<String, dynamic> parsedResponse = json.decode(response);
 return parsedResponse;
 } else if (response is Map<String, dynamic>) {
 // If the response is already a Map, no need to parse it

 return response;
 } else {
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

 // Assuming your API response contains a key 'isValid' indicating whether the OTP is valid or not
 bool isValid = response['isValid'] ?? true;

 return isValid;
 } catch (e) {
 // Handle errors here, such as network issues or server errors
 // You can log the error or throw it back to the calling function
 rethrow;
 }
 }
}
