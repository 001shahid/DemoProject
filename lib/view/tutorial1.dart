// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:lottie/lottie.dart';

// class TutorialScreen1 extends StatefulWidget {
//   const TutorialScreen1({super.key});

//   @override
//   State<TutorialScreen1> createState() => _TutorialScreen1State();
// }

// class _TutorialScreen1State extends State<TutorialScreen1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IntroductionScreen(
//         showNextButton: false,
//         showDoneButton: false,
//         // Hide the "Done" button
//         pages: [
//           PageViewModel(
//               title: "Connect With the People around you",
//               bodyWidget: Center(
//                 child: Column(
//                   children: [
//                     Lottie.asset(
//                       "Assets/animations/animation_lnlfehgk.json",
//                     )
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:instragram_clone/view/sign_up_page.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class TutorialScreen1 extends StatefulWidget {
  const TutorialScreen1({super.key});

  @override
  State<TutorialScreen1> createState() => _TutorialScreen1State();
}

class _TutorialScreen1State extends State<TutorialScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        autoScrollDuration: 1500,
        showNextButton: false,
        showDoneButton: true,
        onDone: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },

        done: const Text("Let's Start",
            style: TextStyle(fontWeight: FontWeight.w600)),

        // showSkipButton: true, // Hide the "Done" button
        // Show the "Skip" button
        pages: [
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ), // Add space before the title
                Text(
                  "Connect With the People around you",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Image.asset(
                    "Assets/images/img_youngboysandyoung.png") // Add space after the title
                // Lottie.asset(
                //   "Assets/animations/animation_lnlfehgk.json",
                // ) // Replace with your image path
              ],
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ), // Add space before the title
                Text(
                  "Connect With the People around you",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ), // Add space after the title
                Lottie.asset(
                  "Assets/animations/animation_lnlgtrj0.json",
                ) // Replace with your image path
              ],
            ),
          ),
          PageViewModel(
            title: "",
            bodyWidget: Column(
              children: [
                SizedBox(
                  //height: 90
                  height: MediaQuery.of(context).size.height * 0.09,
                ), // Add space before the title
                Text(
                  "Connect With the People around you",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  //  height: 50
                  height: MediaQuery.of(context).size.height * 0.05,
                ), // Add space after the title
                Image.asset("Assets/images/img_youngmanwithlaptop.png")
              ],
            ),
          )
        ],
      ),
    );
  }
}
