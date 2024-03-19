import 'package:crud/Auth/home_page.dart';
import 'package:crud/color_page.dart';
import 'package:crud/intro/login.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  getlogin() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    bool loginbool=true;
    loginbool = pref.getBool("login")??false;
    Future.delayed(Duration(
        seconds: 4
    )).then((value) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loginbool==true?homePage():login(),)));
  }
  getLogin() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    int loginint=0;
     loginint = pref.getInt('login1') ?? 0;
    Future.delayed(Duration(
        seconds: 4
    )).then((value) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loginint==1?homePage():login(),)));

  }
  getlogins() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String loginstring="1";
      loginstring = pref.getString("login")??"0";
    Future.delayed(Duration(
        seconds: 4
    )).then((value) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loginstring=="1"?homePage():login(),)));
  }

  @override
  void initState() {
    getLogin();
    // TODO: implement initState

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height*2.5,
        width: width*1,
        color: colorPage.primaryColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CRUD",
            style: TextStyle(
              fontSize: width*0.15,
              fontWeight: FontWeight.w700,
              color: colorPage.secondarycolor
            ),)
          ],
        ),

      )
    );
  }
}
