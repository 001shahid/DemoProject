// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:instragram_clone/res/component/elevatedbutton.dart';
// import 'package:instragram_clone/utils/utils.dart';
// import 'package:instragram_clone/view/complete_profile_screen.dart';

// import 'package:pinput/pinput.dart';

// class OTP extends StatefulWidget {

//   const OTP({super.key});

//   @override
//   State<OTP> createState() => _OTPState();
// }

// class _OTPState extends State<OTP> {
//   final TextEditingController textEditingController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   final int pinLength = 4; // Set the expected PIN length

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Form(
//         key: _formkey,
//         child: Container(
//           margin: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("Assets/img_smilingyoungman.png"),
//               // Replace this with your Lottie animation
//               // Lottie.asset("Assets/animations/animation_lnlzpn0x.json"),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Enter otp sends to your register email ",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   Icon(
//                     Icons.verified,
//                     color: Colors.green,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 // height: 20
//                 height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               Pinput(
//                   length: 4,
//                   autofocus: true,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       Utils.toastMessage("Please enter an OTP");
//                       return "Please enter an OTP";
//                     }
//                     if (value!.length < 4) {
//                       Utils.toastMessage("Please enter a valid OTP");
//                       return "Please enter a valid OTP";
//                     }
//                     return null;
//                   }),

//               SizedBox(
//                 //height: 30
//                 height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.052,
//                     width: MediaQuery.of(context).size.width * 0.23,
//                     child: CustomRoundButton(
//                       onPress: () {
//                         if (_formkey.currentState!.validate()) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const CompleteProfile()));
//                         }
//                         // Called when the "Verify" button is pressed
//                         // Replace this condition with your OTP verification logic
//                         if (isOTPValid(textEditingController.text)) {
//                           // OTP is valid
//                           // Continue with your logic
//                         } else {
//                           // OTP is invalid, clear the input fields
//                           textEditingController.clear();
//                         }
//                       },
//                       title: 'Verify',
//                       // child: Text("Verify"),
//                     ),
//                   ),
//                   SizedBox(
//                     // width: 30,

//                     width: MediaQuery.of(context).size.width * 0.09,
//                   ),
//                   SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.052,
//                       width: MediaQuery.of(context).size.width * 0.23,
//                       child:
//                           CustomRoundButton(title: "Resend", onPress: () {})),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Replace this function with your OTP validation logic
//   bool isOTPValid(String otp) {
//     // Example: Check if OTP is "1234"
//     return otp == '1234';
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:instragram_clone/utils/utils.dart';
import 'package:instragram_clone/view_model/auth_view_model.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTP extends StatefulWidget {
  final String userData;

  const OTP({super.key, required this.userData});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController textEditingController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final int pinLength = 4; // Set the expected PIN length

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("Assets/img_smilingyoungman.png"),
              // Replace this with your Lottie animation
              // Lottie.asset("Assets/animations/animation_lnlzpn0x.json"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter otp sends to your register email ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                  )
                ],
              ),
              SizedBox(
                // height: 20
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Pinput(
                  controller: textEditingController,
                  length: 4,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.toastMessage("Please enter an OTP");
                      return "Please enter an OTP";
                    }
                    if (value!.length < 4) {
                      Utils.toastMessage("Please enter a valid OTP");
                      return "Please enter a valid OTP";
                    }
                    return null;
                  }),

              SizedBox(
                //height: 30
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.052,
                    width: MediaQuery.of(context).size.width * 0.23,
                    child: CustomRoundButton(
                      onPress: () {
                        if (_formkey.currentState!.validate()) {
                          // debugPrint(widget.userData['email']);
                          // debugPrint(textEditingController.text.toString());
                          Map data = {
                            "email": widget.userData,
                            "otp": textEditingController.text.toString(),
                          };

                          authViewModel.verifyOtp(data, context);
                          print("api hit");
                          debugPrint(textEditingController.text.toString());
                          debugPrint(widget.userData);
                          //    Navigator.push(
                          //     context,
                          // MaterialPageRoute(
                          //     builder: (context) =>
                          //         const CompleteProfile()));
                        }

                        if (isOTPValid(textEditingController.text)) {
                          // OTP is valid
                          // Continue with your logic
                        } else {
                          // OTP is invalid, clear the input fields
                          textEditingController.clear();
                        }
                      },
                      title: 'Verify',
                      // child: Text("Verify"),
                    ),
                  ),
                  SizedBox(
                    // width: 30,

                    width: MediaQuery.of(context).size.width * 0.09,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.052,
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: CustomRoundButton(
                          title: "Resend",
                          onPress: () {
                            Map data = {
                              "email": widget.userData,
                            };

                            authViewModel.resendOtp(data, context);
                          })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Replace this function with your OTP validation logic
  bool isOTPValid(String otp) {
    // Example: Check if OTP is "1234"
    return otp == '1234';
  }
}
