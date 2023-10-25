import 'package:flutter/material.dart';
import 'package:instragram_clone/view/tutorial1.dart';
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

    _navigateTutorail();
  }

  _navigateTutorail() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    // ignore: use_build_context_synchronously
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const TutorialScreen1())));
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
