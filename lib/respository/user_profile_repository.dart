import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:instragram_clone/data/network/base_api_services.dart';
import 'package:instragram_clone/data/network/network_services.dart';
import 'package:instragram_clone/res/component/app_url.dart';
import 'package:instragram_clone/respository/shared_perfrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> getUserProfileApi() async {
    try {
      // SharedPreferences sharedPreferences = SharedPreferences.getInstance("")
      String? authToken = await SharedPreferencesManager.getLoginToken();
      String? userId = await SharedPreferencesManager.getUSerId();
      // dynamic header = {"NAME": "socialMedia", "PASS": "social@123"};
      debugPrint("----------------------jitendra---------------------------");
      debugPrint(userId);
      dynamic header = {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "$authToken"
      };
      String url = "${AppUrl.getUserProfile}?userId=$userId";
      debugPrint("*******$url*********");
      dynamic response =
          await NetworkApiService().getGetApiResponse(url, header);
      debugPrint("******* user data $response*********");
      // debugPrint(response);
      return response;
      //print('')
    } catch (e) {
      rethrow;
    }
  }
}
