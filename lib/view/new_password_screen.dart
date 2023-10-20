
import 'package:flutter/material.dart';
import 'package:instragram_clone/provider/password_provider.dart';
import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:instragram_clone/view_model/widget/custom.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    passwordFocusNode.dispose();
    confirmFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("bbfs");
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "Assets/animations/animation_lnr7lw6j (1).json",
             
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Consumer<PasswordVisibilityNotifier>(
                    builder: (context, passwordVisibilityNotifier, child) {
                      return CustomTextFormField(
                        controller: passwordController,
                        prefixIcon: Icons.password,
                        obscureText:
                            !passwordVisibilityNotifier.isPassword1Visible,
                        focusNode: passwordFocusNode,
                        hintText: "Enter Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your password";
                          }
                          return null;
                        },
                        onTap: () {
                          passwordFocusNode.requestFocus();
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordVisibilityNotifier
                                .togglePassword1Visibility();
                          },
                          child: Icon(
                            passwordVisibilityNotifier.isPassword1Visible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Consumer<PasswordVisibilityNotifier>(
                    builder: (context, passwordVisibilityNotifier, child) {
                      return CustomTextFormField(
                        controller: confirmController,
                        prefixIcon: Icons.lock,
                        obscureText:
                            !passwordVisibilityNotifier.isPassword2Visible,
                        focusNode: confirmFocusNode,
                        hintText: "Confirm Your Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          }
                          if (value != passwordController.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                        onTap: () {
                          confirmFocusNode.requestFocus();
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordVisibilityNotifier
                                .togglePassword2Visibility();
                          },
                          child: Icon(
                            passwordVisibilityNotifier.isPassword2Visible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomRoundButton(
                    title: "Reset Password",
                    onPress: () {
                      if (formkey.currentState!.validate()) {
                        // Handle button press
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
