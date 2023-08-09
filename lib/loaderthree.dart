import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshipproj/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Loaderthree extends StatefulWidget {
  const Loaderthree({Key? key}) : super(key: key);

  @override
  State<Loaderthree> createState() => _LoaderthreeState();
}

class _LoaderthreeState extends State<Loaderthree> {
  int activeIndex = 0;
  final urlImages = [
    'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1662045010180-a2b1ac1652b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1591504771093-24cf5e930a00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
  ];
  final List<String> textdata= ["Workouts made for you", "Become stronger everyday","Track Progess"];
  @override
  Widget build(BuildContext context) {
    double widh = MediaQuery.of(context).size.width;

    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                        height: h * 0.8,
                        viewportFraction: 1,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 5),
                        onPageChanged: (index, reason) =>
                            {setState(() => activeIndex = index)})),
                const SizedBox(
                  height: 5,
                ),
                buildIndicator(),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  child: SizedBox(
                    width: widh / 1.1,
                    height: h / 20,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () => {

                            },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Continue ',
                                  style: GoogleFonts.getFont("Montserrat",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20)),
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect:
            ExpandingDotsEffect(activeDotColor: Colors.redAccent, dotHeight: 5),
      );
  Widget buildImage(String urlImage, int index) => Container(
        margin: null,
        color: Colors.grey,
        child: Stack(
          children: [
            Image.network(
              urlImage,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                textdata[index],
                style: (GoogleFonts.getFont(
                  'Righteous',
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                )),
              ),
            ),

          ],
        ),
      );
}
