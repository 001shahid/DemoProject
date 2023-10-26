import 'package:flutter/material.dart';
import 'package:instragram_clone/provider/password_provider.dart';
import 'package:instragram_clone/res/component/app_images.dart';
import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:instragram_clone/utils/routes/routes_name.dart';
import 'package:instragram_clone/view_model/auth_view_model.dart';
import 'package:instragram_clone/view_model/widget/custom.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Define a form key
  final passwordFocusNode = FocusNode();
  // Password validation regex
  // final passwordRegex = RegExp(
  //   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
  // );

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey, // Assign the form key
          child: Container(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Lottie.asset(AppImage.loginimage)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    hintText: "Enter Email  ",
                    controller: emailController,
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your email";
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
                  // CustomTextFormField(
                  //   hintText: "Enter Password ",
                  //   controller: passwordController,
                  //   prefixIcon: Icons.lock,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Please Enter Your password";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  Consumer<PasswordVisibilityNotifier>(
                    builder: (context, passwordVisibilityNotifier, child) {
                      return CustomTextFormField(
                        controller: passwordController,
                        prefixIcon: Icons.lock,
                        obscureText:
                            !passwordVisibilityNotifier.isPassword1Visible,
                        focusNode: passwordFocusNode,
                        hintText: "Enter Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your password";
                          }
                          // if (!passwordRegex.hasMatch(value)) {
                          //   return "Password must contain at least one lowercase letter,\n one uppercase letter, one number, one special character, and be at least 6 characters long.";
                          // }
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
                  SizedBox(
                    // width: 340,
                    // height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * .055,
                    child: CustomRoundButton(
                      title: "Login",
                      loading: authViewModel.loading,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, continue with your login logic

                          Map<String, dynamic> data = {
                            //"username": usernameController.text,
                            "email": emailController.text,
                            "password": passwordController.text,
                          };
                          authViewModel.loginApi(data, context);
                          print("api hit");
                          debugPrint(emailController.text);
                          debugPrint(passwordController.text);
                        }
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.verify);
                    },
                    child: const Text("Forget Password"),
                  ),
                  SizedBox(
                    // height: 10,
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signupscreen);
                    },
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "Don't have an account ?",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: " Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
