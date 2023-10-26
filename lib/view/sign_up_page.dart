import 'package:flutter/material.dart';
import 'package:instragram_clone/provider/password_provider.dart';
import 'package:instragram_clone/res/component/app_images.dart';
import 'package:instragram_clone/res/component/elevatedbutton.dart';
import 'package:instragram_clone/utils/routes/routes_name.dart';
import 'package:instragram_clone/view_model/auth_view_model.dart';
import 'package:instragram_clone/view_model/widget/custom.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Define a form key
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final ScrollController _scrollController = ScrollController();
  //  Password validation regex
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
  );

  @override
  void initState() {
    super.initState();

    // Add listeners to focus nodes
    usernameFocus.addListener(_scrollToFocusedField);
    emailFocus.addListener(_scrollToFocusedField);
    passwordFocus.addListener(_scrollToFocusedField);
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Scroll to the currently focused field
  // void _scrollToFocusedField() {
  //   if (FocusScope.of(context).hasPrimaryFocus) return;
  //   Future.delayed(Duration(milliseconds: 300), () {
  //     _scrollController.animateTo(
  //       _getOffset(),
  //       duration: Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }
  void _scrollToFocusedField() {
    if (_formKey.currentState != null && !_formKey.currentState!.validate()) {
      return;
    }
    Future.delayed(Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _getOffset(),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  double _getOffset() {
    if (usernameFocus.hasFocus) {
      return 0.0;
    } else if (emailFocus.hasFocus) {
      return MediaQuery.of(context).size.height * 0.02;
    } else if (passwordFocus.hasFocus) {
      return MediaQuery.of(context).size.height * 0.04;
    }
    return 0.0;
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
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Lottie.asset(
                      AppImage.signupimage,
                      // height: 250,
                      // height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: usernameController,
                    hintText: "Enter Username",
                    prefixIcon: Icons.account_box,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your username";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormField(
                    hintText: "Enter Your Email",
                    controller: emailController,
                    prefixIcon: Icons.email,
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
                  // CustomTextFormField(
                  //   controller: passwordController,
                  //   hintText: "Enter Password",
                  //   prefixIcon: Icons.lock,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Please Enter your password";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // CustomTextFormField(
                  //   controller: passwordController,
                  //   hintText: "Enter Password",
                  //   prefixIcon: Icons.lock,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Please Enter your password";
                  //     }

                  //     // Password validation regex
                  //     final passwordRegex = RegExp(
                  //       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$',
                  //     );

                  //     if (!passwordRegex.hasMatch(value)) {
                  //       return "Password must contain at least one lowercase letter,\n one uppercase letter, one number, one special character, and be at least 6 characters long.";
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
                        //  focusNode: passwordFocus,
                        hintText: "Enter Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your password";
                          }
                          if (!passwordRegex.hasMatch(value)) {
                            return "Password must contain at least one lowercase letter,\n one uppercase letter, one number, one special character, and be at least 6 characters long.";
                          }
                          return null;
                        },
                        onTap: () {
                          // passwordFocus.requestFocus();
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
                    // height: 20,
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * .055,
                    child: CustomRoundButton(
                      onPress: () {
                        //loading
                        if (_formKey.currentState!.validate()) {
                          Map data = {
                            "username": usernameController.text,
                            "email": emailController.text,
                            "password": passwordController.text
                          };
                          debugPrint(emailController.text);
                          debugPrint(passwordController.text);
                          // authViewModel.signupApi(data, context);
                          authViewModel.signupApi(
                              data, emailController.text, context);
                          print("api hit");

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             OTP(userData: emailController.text)));
                        }
                      },
                      //loading:AuthViewModel.signupApi(data,context),
                      loading: authViewModel.loading,
                      title: "Sign Up",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "Already have an account ?",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: " Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
