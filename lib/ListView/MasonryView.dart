import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Masonry extends StatefulWidget {
  const Masonry({Key? key}) : super(key: key);

  @override
  State<Masonry> createState() => _MasonryState();
}

class _MasonryState extends State<Masonry> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        itemCount: 12,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Column(
            children: [
              Container(
                color: Colors.redAccent,width: 180,
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text("Workout Name",style: GoogleFonts.getFont("Montserrat",
                      fontWeight: FontWeight.w300, fontSize: 10,color: Colors.white)),
                ),
              ),
              Image.asset('assets/images/i${index+1}.jpg'),
              Container(
                width: 190,
                color: Colors.grey,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text:  TextSpan(
                          children: [
                            TextSpan(text: 'Duration :              ', style: GoogleFonts.getFont("Montserrat",
                                fontWeight: FontWeight.w700, fontSize: 10,color: Colors.black), ),

                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(Icons.timer_sharp,color: Colors.white,size: 10,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(Icons.accessibility_new,size: 10,color: Colors.white,),
                    SizedBox(width: 10,),
                    Icon(Icons.fitness_center_rounded,size: 10,color: Colors.white,)
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
