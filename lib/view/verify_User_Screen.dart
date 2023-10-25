import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:instragram_clone/res/component/app_images.dart';
import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:instragram_clone/utils/utils.dart';
import 'package:instragram_clone/view_model/widget/auth_view_model.dart';
import 'package:instragram_clone/view_model/widget/custom.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyUser extends StatefulWidget {
  const VerifyUser({super.key});

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Define a form key
  bool isOTPValid = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel2 = Provider.of<AuthViewModel>(context);
    final authViewModel3 = Provider.of<AuthViewModel>(context);
    final authViewModel4 = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey, // Assign the form key
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Lottie.asset(AppImage.verifyuser)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: Icons.email,
                hintText: "Enter Your Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your email";
                  }
                  if (!value.contains("@")) {
                    return "Please Enter a Valid email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text.toString().trim();

                  debugPrint(emailController.text.toString().trim());
                  if (email.isNotEmpty) {
                    Map<String, dynamic> data = {
                      "email": email,
                    };

                    authViewModel2.forgetPassword(data, context);
                  }
                  if (_formKey.currentState!.validate()) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              "Assets/animations/animation_lnlzpn0x.json",
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Enter OTP Sent to your registered Email ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Pinput(
                              controller: otpController,
                              length: 4,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                setState(() {
                                  isOTPValid = value.length == 4;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  debugPrint("hkgk");
                                  Utils.toastMessage("Please enter an OTP");
                                  return "Please enter an OTP";
                                }
                                if (value.length < 4) {
                                  Utils.toastMessage(
                                      "Please enter a valid OTP");
                                  return "Please enter a valid OTP";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  // width: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  child: CustomRoundButton(
                                    title: "Verify",
                                    onPress: () {
                                      if (_formKey.currentState!.validate() &&
                                          isOTPValid) {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         const NewPassword(),
                                        //   ),
                                        // );

                                        Map data = {
                                          "email":
                                              emailController.text.toString(),
                                          "otp": otpController.text.toString(),
                                        };
                                        authViewModel3.verifyForgetApi(
                                            data, context);
                                      } else {
                                        Utils.toastMessage("OTP is required");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  // width: 30,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                SizedBox(
                                  // width: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  child: CustomRoundButton(
                                    title: "Resend",
                                    onPress: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => NewPassword(),
                                      //   ),
                                      // );
                                      Map data = {
                                        "email":
                                            emailController.text.toString(),
                                      };

                                      authViewModel4.resendOtp(data, context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text("Send OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
