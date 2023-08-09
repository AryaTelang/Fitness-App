
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshipproj/Bars/BottomNavBar.dart';
import 'package:internshipproj/Camera.dart';
import 'package:internshipproj/MusicPlayer.dart';
import 'package:internshipproj/SignUp.dart';

import 'Bars/AppBarS.dart';
import 'ListView/ListView.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double widh = MediaQuery.of(context).size.width;

    double h = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 40,left: 25,right: 20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(

                  color: Colors.deepOrange,
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

                height: 40,
                width: 150,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Active",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
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

                height: 40,
                width: 150,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "New",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListVieW(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
