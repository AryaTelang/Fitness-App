import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListVieW extends StatefulWidget {
  const ListVieW({Key? key}) : super(key: key);

  @override
  State<ListVieW> createState() => _ListVieWState();
}

class _ListVieWState extends State<ListVieW> {
  Future get() async {}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: SnackBar(
                content: Text(
                  snapshot.error.toString(),
                  style: TextStyle(letterSpacing: 1.5),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.redAccent,
              ),
            );
          } else {
            var itemObj = snapshot.data;

            return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 15,
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 10, bottom: 20),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Container(
                        width: 242,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Color(0xffEDE5D8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.grey,
                                            size: 10,
                                          ),
                                          Text(
                                            "1323 people have joined ",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "ARMS",
                                        style: GoogleFonts.inter(
                                          fontSize: 40,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Bicep +Tricep+ Shoulder",
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/man-removebg-preview.png",
                                        fit: BoxFit.fill,
                                        height: 120,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Join"),
                                style:ButtonStyle(  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),)),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ));
          }
        });
    ;
  }
}
