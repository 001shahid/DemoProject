import 'package:flutter/material.dart';
import 'package:instragram_clone/respository/shared_perfrence.dart';
import 'package:instragram_clone/view/home_page_screen.dart';
import 'package:instragram_clone/view/splash_services.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginToken();

  }


  _checkLoginToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginToken = await SharedPreferencesManager.getLoginToken();

    if (loginToken != null) {
      // Login token exists, navigate to the homepage.
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // Login token is null, navigate to the splash screen.
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => SpalshScreenServices()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Lottie.asset("Assets/animations/animation_lnrbqhqz.json"),
      ),
    ));
  }
}
