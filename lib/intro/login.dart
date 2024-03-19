import 'package:crud/Auth/signup.dart';
import 'package:crud/intro/login_signup.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   Future.delayed(Duration(
  //       seconds: 4
  //   )).then((value) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginSignup(),)));
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.primaryColor,
      body: Padding(padding: EdgeInsets.all(width*0.05),
      child: Column(
       children: [
         Container(
           height: width*1,
           width: width*1,
           padding: EdgeInsets.only(left: width*0.07),
           decoration: BoxDecoration(
               image:DecorationImage(image: AssetImage(imagePage.splash,),fit: BoxFit.fill)
           ),

         ),
             Text("CRUD",
           style: TextStyle(
               fontSize: width*0.08,
               fontWeight: FontWeight.w600,
               color: colorPage.secondarycolor
           ),),
         SizedBox(height: width*0.05,),
         Text("Create, Read, Update ,Delete",
           style: TextStyle(
               fontSize: width*0.04,
               fontWeight: FontWeight.w400,
               color: colorPage.secondarycolor
           ),),
         SizedBox(height: width*0.05,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) =>loginSignup(),));
           },
           child: Container(
             height: width*0.1,
             width: width*0.6,
             decoration: BoxDecoration(
               color: colorPage.secondarycolor,
               borderRadius: BorderRadius.circular(width*0.04)
             ),
             child: Center(
               child: Text("Login",
               style: TextStyle(
                 fontWeight: FontWeight.w500,
                 fontSize: width*0.04,
                 color: colorPage.primaryColor
               ),),
             ),
           ),
         ),
         SizedBox(height: width*0.05,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) =>signup(gsignIn: false,email: '', name: '', photo: '',),));
           },
           child: Container(
             height: width*0.1,
             width: width*0.6,
             decoration: BoxDecoration(
             border: Border.all(color: colorPage.secondarycolor),
               borderRadius: BorderRadius.circular(width*0.04)
             ),
             child: Center(
                 child: Text("Sign up",
                 style: TextStyle(
                   fontWeight: FontWeight.w500,
                   fontSize: width*0.04,
                   color: colorPage.secondarycolor
                 ),),

             ),
           ),
         ),
       ],
      ),),
    );
  }
}
