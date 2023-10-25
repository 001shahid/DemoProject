import 'package:flutter/material.dart';
import 'package:instragram_clone/utils/routes/routes_name.dart';
import 'package:instragram_clone/view/home_page_screen.dart';
import 'package:instragram_clone/view/login_page.dart';
import 'package:instragram_clone/view/new_password_screen.dart';
import 'package:instragram_clone/view/sign_up_page.dart';
import 'package:instragram_clone/view/verify_User_Screen.dart';

class Routes {
  // ignore: non_constant_identifier_names
  static Route<dynamic> MaterialPageRoutegenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.home:
      // return  MaterialPageRoute(builder: (BuildContext context)=> HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      // case RoutesName.walkScreen:
      //   return MaterialPageRoute(builder: (BuildContext context)=>const WalkThroughPage());
      // case RoutesName.splash:
      //   return MaterialPageRoute(builder: (BuildContext context)=>const SpalshScreen());

      //  case RoutesName.phoneNumberScreen:
      //   return MaterialPageRoute(builder: (BuildContext context)=> const PhoneNumberScreen());

      // case RoutesName.otp:
      //   return MaterialPageRoute(builder: (BuildContext context)=>  OTP(userData: data,));

      //  case RoutesName.completeprofile:
      //   return MaterialPageRoute(builder: (BuildContext context)=> CompleteProfile ());

      case RoutesName.verify:
        return MaterialPageRoute(
            builder: (BuildContext context) => const VerifyUser());

      case RoutesName.signupscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      case RoutesName.changerPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NewPassword());
      // case RoutesName.otp:
      //   if (settings.arguments != null) {
      //     return MaterialPageRoute(
      //         builder: (BuildContext context) => OTP(
      //               userData: settings.arguments as String,
      //             ));
      //   } else {
      //     return MaterialPageRoute(
      //         builder: (_) => const Scaffold(
      //               body: Center(
      //                 child: Text("No Routes Found "),
      //               ),
      //             ));
      //   }
      //     case RoutesName.signupscreen:
      // return MaterialPageRoute(
      //     builder: (BuildContext context) => SignUpScreen());

      //     case RoutesName.otp:
      // return MaterialPageRoute(
      //     builder: (BuildContext context) => OTP());

      // case RoutesName.tutorial1:
      //   return MaterialPageRoute(builder: (BuildContext context)=>   TutorialScreen1());
      // case RoutesName.profileScreen:
      //  return MaterialPageRoute(builder: (BuildContext context)=>   ProfileScreen(loginModel: LoginModel(),));
      // case RoutesName.pinScreen:
      //  return MaterialPageRoute(builder: (BuildContext context)=>   PinScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("No Routes Found "),
                  ),
                ));
    }
  }
}
