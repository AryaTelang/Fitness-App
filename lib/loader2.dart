import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshipproj/loaderthree.dart';
import 'package:internshipproj/login.dart';
import 'package:lottie/lottie.dart';

class Loadertwo extends StatefulWidget {
  const Loadertwo({Key? key}) : super(key: key);

  @override
  State<Loadertwo> createState() => _LoadertwoState();
}

class _LoadertwoState extends State<Loadertwo> {
  @override
  Widget build(BuildContext context) {
    double widh = MediaQuery.of(context).size.width;

    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/spencer-davis-0ShTs8iPY28-unsplash.jpg"),
              opacity: 80,
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(children: [
                  SizedBox(
                width: widh * 1.5,
                height: h * 0.11,
                  ),
                 Image.asset("assets/images/logofit-removebg-preview.png",height: 70,),
                  Text(
                "Healthi",
                style: (GoogleFonts.getFont(
                  'Righteous',
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                )),
                textAlign: TextAlign.center,
                  ),
                  SizedBox(
                height: h / 3,
                  ),
                  Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,height: 10,
                    ),
                    Text(
                      "GOOD DAY",
                      style: (GoogleFonts.getFont(
                        'Bebas Neue',
                        fontSize: 70,
                        color: Colors.white,
                      )),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                  ),
                  Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [

                      Text(
                        "HEALTHY BODY",
                        style: (GoogleFonts.getFont(
                          'Bebas Neue',
                          fontSize: 60,
                          color: Colors.white,
                        )),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        ".",
                        style: (GoogleFonts.getFont(
                          'Bebas Neue',
                          fontSize: 60,
                          color: Colors.redAccent,
                        )),
                      ),
                    ],
                  ),
                ),
                  ),
                  GestureDetector(
                child: SizedBox(
                  width: widh / 1.1,
                  height: h / 20,
                  child: ElevatedButton(
                      child: Text("Get Started",
                          style: GoogleFonts.getFont("Montserrat",
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () => {
                            Get.to(
                              () => Loaderthree(),
                              transition: Transition.fade,
                              duration: Duration(seconds: 1),
                            ),
                          }),
                ),
                  )
                ]),
              ))),
    );
  }
}
