
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internshipproj/Phone.dart';
import 'package:internshipproj/loading%20screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fitness App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPhone(),debugShowCheckedModeBanner: false,
    );
  }
}


