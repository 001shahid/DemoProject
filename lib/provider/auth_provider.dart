// // // auth_provider.dart
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:instragram_clone/data/network/network_services.dart';
// import 'package:instragram_clone/models/user_model.dart';
// import 'package:instragram_clone/res/component/app_url.dart';

// class AuthProvider with ChangeNotifier {
//   final _apiServices = NetworkService();

//   bool _loading = false;
//   bool get loading => _loading;

//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }

//   void login(String email, String password) async {
//     setLoading(true);
//     try {
//       Response response = await post(Uri.parse(AppUrl.signupapi), body: {
//         'email': email,
//         'password': password,
//       });
//       if (response.statusCode == 200) {
//         print("Login successful");
//         setLoading(false);
//       } else {
//         setLoading(false);
//         print("Login failed");
//       }
//     } catch (e) {
//       setLoading(false);
//       print("Error during login: $e");
//     }
//   }

//   Future<dynamic> signupApi(SignupModel signupData) async {
//     try {
//       final response = await _apiServices.getPostApiResponse(
//         AppUrl.signupapi,
//         signupData.toJson(),

//       );
//       return response;
//     } catch (e) {
//       throw e;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
          Uri.parse("https://pranavsocial.appskeeper.in/api/v1/user/signup"),
          body: {
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        print("successfully");
        setLoading(false);
      } else {
        setLoading(false);
        print("failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
