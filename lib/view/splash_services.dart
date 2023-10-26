import 'package:flutter/material.dart';
import 'package:instragram_clone/view/tutorial1.dart';
import 'package:lottie/lottie.dart';

class SpalshScreenServices extends StatefulWidget {
  const SpalshScreenServices({super.key});

  @override
  State<SpalshScreenServices> createState() => _SpalshScreenServicesState();
}

class _SpalshScreenServicesState extends State<SpalshScreenServices> {
  @override
  void initState() {
    super.initState();

    _navigateTutorail();
  }

  _navigateTutorail() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    // ignore: use_build_context_synchronously
    // Navigator.push(context,
    //     MaterialPageRoute(builder: ((context) => const TutorialScreen1())));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => TutorialScreen1()),
        (route) => false);
  }

  // _checkLoginToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? loginToken = prefs.getString('loginToken');

  //   if (loginToken != null) {
  //     // Login token exists, navigate to the homepage.
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     // Login token is null, navigate to the splash screen.
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => SpalshScreenServices()));
  //   }
  // }

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
