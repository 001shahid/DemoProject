import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instragram_clone/respository/shared_perfrence.dart';
import 'package:instragram_clone/utils/routes/routes_name.dart';
import 'package:instragram_clone/view/home_page_screen.dart';
import 'package:instragram_clone/view/otp_page.dart';
import '../respository/auth_respository.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  //final String apiUrl = "https://example.com/api/signup";
  //final String username = "socailMedia";
  //final String password = "social@123";
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signuploading = false;
  bool get signuploading => _signuploading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setsignupLoading(bool value) {
    //_setsignuploading = value;
    _signuploading = value;
    notifyListeners();
  }

//***************************************SignUpApi*********************************************//
  Future<void> signupApi(
      dynamic data, String email, BuildContext context) async {
    //setsignupLoading(true);
    setLoading(true);
    //data = {"username" : "Shahid@1", "password":"Shahid@1" ,"email": "zaynkhan384@gmail.com"};
    _myRepo.signupApi(data).then((value) {
      //  setsignupLoading(false);
      setLoading(false);
      Utils.flashBarErrorMessage('signup successful', context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OTP(userData: email)));

      debugPrint(value.toString());

      // Navigator.pushNamed(context, RoutesName.otp);
      if (kDebugMode) {
        //print(value.toString());
      }
    }).onError((error, stackTrace) {
      setsignupLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

//***************************************VerifyOtpApi*********************************************//
  Future<void> verifyOtp(dynamic data, BuildContext context) async {
    setLoading(true);
    // Assume your API endpoint for OTP verification is named 'verifyOtp'
    // Modify the API call according to your backend setup
    _myRepo.verifyOtpApi(data).then((bool isOtpValid) {
      setLoading(false);
      if (isOtpValid) {
        Utils.flashBarErrorMessage('OTP verified successfully', context);
        // Navigate to the next screen after OTP verification
        // Navigator.pushNamed(context, RoutesName.home);
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false);
      } else {
        Utils.flashBarErrorMessage('Invalid OTP. Please try again.', context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error verifying OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

//***************************************ResendOtpApi*********************************************//

  Future<void> resendOtp(dynamic data, BuildContext context) async {
    setLoading(true);

    // Call your API to resend the OTP (replace 'resendOtpApi' with your actual API call)
    _myRepo.resendOtpApi(data).then((_) {
      setLoading(false);
      Utils.flashBarErrorMessage('OTP resent successfully', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error resending OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
  //***************************************LoginApi*********************************************//

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginapi(data).then((value) {
      debugPrint(value.toString());

      Utils.flashBarErrorMessage('login successful', context);
      setLoading(false);
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (route) => false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.flashBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        Utils.flashBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  //***************************************ForgetPasswordApi*********************************************//

  Future<void> forgetPassword(dynamic data, BuildContext context) async {
    setLoading(true);

    // Call your API to resend the OTP (replace 'resendOtpApi' with your actual API call)
    _myRepo.forgetPasswordApi(data).then((_) {
      setLoading(false);
      Utils.flashBarErrorMessage('OTP resent successfully', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error resending OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  //***************************************ResetPasswordApi*********************************************//
  Future<void> resetPassword(dynamic data, BuildContext context) async {
    setLoading(true);
    debugPrint("fdghjkljgfgc");
    debugPrint(data.toString());

    try {
      _myRepo.resetPasswordApi(data).then((_) {
        setLoading(false);
        Utils.flashBarErrorMessage('Password reset successful', context);
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (routes) => false);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.flashBarErrorMessage('Error resetting password: $error', context);
        if (kDebugMode) {
          print(error.toString());
        }
      });
    } catch (error) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error obtaining authToken: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  //***************************************VerifyOtpForgetApi*********************************************//
  Future<void> verifyForgetApi(dynamic data, BuildContext context) async {
    setLoading(true);
    // Assume your API endpoint for OTP verification is named 'verifyOtp'
    // Modify the API call according to your backend setup
    _myRepo.verifyOtpApiforget(data).then((bool isOtpValid) {
      setLoading(false);
      if (isOtpValid) {
        Utils.flashBarErrorMessage('OTP verified successfully', context);
        // Navigate to the next screen after OTP verification
        // Navigator.pushNamed(context, RoutesName.home);
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.changerPassword, (route) => false);
      } else {
        Utils.flashBarErrorMessage('Invalid OTP. Please try again.', context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error verifying OTP: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  //***************************************LogoutApi*********************************************//
  // Future<void> logout(BuildContext context) async {
  //   String? authToken = await SharedPreferencesManager.getLoginToken();
  //   setLoading(true);
  //   debugPrint(authToken.toString());
  //   try {
  //     await _myRepo.logoutApi(authToken);
  //     //Utils.flashBarErrorMessage("Logout Successfully", context);

  //     // Navigate to the login screen after successful logout
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, RoutesName.login, (routes) => false);

  //     setLoading(false);
  //   } catch (error) {
  //     setLoading(false);
  //     Utils.flashBarErrorMessage('Error during logout: $error', context);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   }
  // }
  // Future<void> logout(BuildContext context) async {
  //   String? authToken = await SharedPreferencesManager.getLoginToken();
  //   setLoading(true);
  //   //-----------------------------authToken---------------------------//
  //   debugPrint(
  //       "-----------------------------authToken1---------------------------");
  //   debugPrint(authToken);
  //   debugPrint(
  //       "-----------------------------SharedauthToken1---------------------------");
  //   String? s1 = await SharedPreferencesManager.getResetPasswordToken();
  //   debugPrint(s1);

  //   try {
  //     await _myRepo.logoutApi(authToken);
  //     // Utils.flashBarErrorMessage("Logout Successfully", context);

  //     // Navigate to the login screen after successful logout
  //     SharedPreferencesManager.deleteLoginToken();
  //     debugPrint(
  //         "-----------------------------authToken2---------------------------");
  //     debugPrint(authToken);
  //     debugPrint(
  //         "-----------------------------SharedauthToken2---------------------------");
  //     String? s2 = await SharedPreferencesManager.getResetPasswordToken();
  //     debugPrint(s2);
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, RoutesName.login, (routes) => false);

  //     setLoading(false);
  //   } catch (error) {
  //     setLoading(false);
  //     Utils.flashBarErrorMessage('Error during logout: $error', context);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   }
  // }
  Future<void> logout(BuildContext context) async {
    // Retrieve the authentication token from shared preferences.
    String? authToken = await SharedPreferencesManager.getLoginToken();

    // Set loading state to indicate the logout process has started.
    setLoading(true);

    try {
      debugPrint(
          "------------------------------authToken1--------------------------");
      String? s2 = await SharedPreferencesManager.getLoginToken();
      debugPrint(s2);
      // Delete the token from shared preferences first.
      SharedPreferencesManager.deleteLoginToken();

      // Now, perform the logout action (if any).
      await _myRepo.logoutApi(authToken);

      // At this point, 'authToken' should be deleted, and any debugPrint will show it as null.
      debugPrint(
          "------------------------------authToken2--------------------------");
      String? s1 = await SharedPreferencesManager.getLoginToken();
      debugPrint(s1);

      // Navigate to the login screen after successful logout.
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.login, (routes) => false);

      // Set loading state to indicate the logout process is complete.
      setLoading(false);
    } catch (error) {
      // If there's an error during logout, handle it and display an error message.
      setLoading(false);
      Utils.flashBarErrorMessage('Error during logout: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
  //***************************************CreatePostApi*********************************************//

  Future<void> createPost(dynamic data, BuildContext context) async {
    setLoading(true);

    try {
      // Create a map containing the post data to be sent to the API
      // Map<String, dynamic> postData = {
      //   "url": url,
      //   "caption": caption,
      //   "mediaType": mediaType,
      // };

      // Call your API endpoint to create a new post (replace 'createPostApi' with your actual API endpoint)
      await _myRepo.createPostApi(data);

      // Perform any necessary actions after the post is successfully created
      // For example, navigate to the home page
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (routes) => false);

      setLoading(false);
    } catch (error) {
      setLoading(false);
      Utils.flashBarErrorMessage('Error creating post: $error', context);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
