/*

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshipproj/HomePage.dart';
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';

import 'SignUp.dart';
import 'Utils.dart';
import 'landing.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = "", password = "";
  bool hidden = true;
  String adminemail = "";
  String adminpassword = "";
  bool adminE = false;
  bool adminP = false;

  late final List<CameraDescription> cameras;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widh = MediaQuery.of(context).size.width;

    double h = MediaQuery.of(context).size.height;
    return Form(
        key: formKey,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: const Color(0xffFFF3E2),
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: SingleChildScrollView(
              child: Column(children: [
                LottieBuilder.network(
                    "https://assets6.lottiefiles.com/packages/lf20_8xkaygbw.json",height: h/3,),
                Center(
                  child: Container(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        children: [
                          SizedBox(
                            width: widh / 10,
                          ),
                          Text(
                            "Welcome back",
                            style: (GoogleFonts.getFont(
                              'Montserrat',
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            ".",
                            style: TextStyle(
                                fontSize: 60, color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                const Padding(padding: EdgeInsets.all(10.0)),
                Container(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Your Email address")),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(13),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Email",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            errorStyle: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500),
                            enabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none)),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) {
                          if (email != null &&
                              !EmailValidator.validate(email)) {
                            return 'Please enter a Valid Email';
                          }
                          return null;
                        },
                        controller: _emailController,
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Enter your password")),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: hidden,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                          errorStyle: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                hidden = !hidden;
                              });
                            },
                            child: Icon(
                              !hidden ? Icons.visibility : Icons.visibility_off,
                              size: 20,
                            ),
                          ),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.redAccent),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          } else if (value.length < 6) {
                            return "Enter minimum six characters";
                          }
                          return null;
                        },
                        controller: _passwordController,
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      SizedBox(
                        height: h / 100,
                      ),
                      GestureDetector(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black54,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Landing()));
                        },
                      ),
                      SizedBox(
                        height: h / 30,
                      ),
                      SizedBox(
                        width: widh / 1.1,
                        height: h / 15,
                        child: ElevatedButton(
                            child: Text("Log In",
                                style: GoogleFonts.getFont("Montserrat",
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.red),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(color: Colors.red)))),
                            onPressed: () => {
                              Get.to(
                                    () => HomePage(),
                                transition: Transition.upToDown,
                                duration: Duration(seconds: 1),
                              ),
                                }),
                      ),
                      const SizedBox(
                        width: 20.0,
                        height: 50.0,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Haven't yet made an account? Click here to ",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                    },
                                  text: "Sign Up.",
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.redAccent))
                            ]),
                      ),
                      const SizedBox(
                        width: 20.0,
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        )));
  }
}
*/
