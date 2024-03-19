import 'package:crud/Auth/add_user.dart';
import 'package:crud/Auth/banner.dart';
import 'package:crud/Auth/edit_user.dart';
import 'package:crud/Auth/home_page.dart';
import 'package:crud/Auth/otp.dart';
import 'package:crud/Auth/phone_number.dart';
import 'package:crud/Auth/postal_codes.dart';
import 'package:crud/Auth/signup.dart';
import 'package:crud/Auth/update_profile.dart';
import 'package:crud/Auth/user.dart';
import 'package:crud/intro/login_signup.dart';
import 'package:crud/intro/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
var width;
var height;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },



      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
      ),
        debugShowCheckedModeBanner: false,
        home: loginSignup()
      ),
    );
  }
}