



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Auth/home_page.dart';
import 'package:crud/Auth/otp.dart';
import 'package:crud/Auth/phone_number.dart';
import 'package:crud/Auth/signup.dart';
import 'package:crud/Auth/user.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class loginSignup extends StatefulWidget {
  const loginSignup({Key? key}) : super(key: key);

  @override
  State<loginSignup> createState() => _loginSignupState();
}

class _loginSignupState extends State<loginSignup> {
  TextEditingController userController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool visibility=true;
  final formKey=GlobalKey<FormState>();
  bool check1=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPage.primaryColor,
appBar: AppBar(
  elevation: 0,
  title: Text("CRUD",
  style: TextStyle(
    color: Colors.black
  ),),
  backgroundColor: colorPage.primaryColor,
),
      body: Padding(padding: EdgeInsets.all(width*0.03),
      child: Column(
        children: [
        Container(
        height: width*0.6,
        width: width*1,
        padding: EdgeInsets.only(left: width*0.07),
        decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage(imagePage.login,),fit: BoxFit.fill)
        ),

      ),
          SizedBox(height: width*0.05,),
          TextFormField(
            controller: userController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: width*0.04,
              fontWeight: FontWeight.w700,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w700,
                    color: colorPage.color3
                ),
                hintText: "Enter your username",
                hintStyle: TextStyle(
                    fontSize: width*0.03,
                    fontWeight: FontWeight.w700
                ),
                border:OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorPage.color4
                    )
                ),
                enabledBorder: OutlineInputBorder(

                  borderSide: BorderSide(
                    color: colorPage.secondarycolor,
                  ),
                  borderRadius: BorderRadius.circular(width*0.03),

                )
            ),
          ),
          SizedBox(height: width*0.05,),
          TextFormField(
            onChanged: (value){
              setState(() {

              });

            },
            controller: passwordController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: visibility?true:false,
            style:TextStyle(
              fontSize: width*0.04,
              fontWeight: FontWeight.w600,
            ) ,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            decoration: InputDecoration(

              suffixIcon: InkWell(
                onTap: (){
                  visibility=!visibility;
                  setState(() {

                  });
                },
                child: Icon(visibility==true?Icons.visibility_off_outlined:Icons.visibility_outlined,color: colorPage.color3,),

              ),
              // Container(
              //   height: width*0.02,
              //   width: width*0.02,
              //   child: Center(
              //     child:SvgPicture.asset(imagePage.password,height: width*0.06,width: width*0.06,) ,
              //   ),
              // ),
              labelText: "Password",
              labelStyle: TextStyle(
                  fontSize: width*0.04,
                  fontWeight: FontWeight.w700,
                  color: colorPage.color3
              ),
              hintText: "Enter your password",
              hintStyle: TextStyle(
                fontSize:width*0.04,
                fontWeight: FontWeight.w700,
                color: colorPage.color3,
              ),

                border:OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorPage.color4
                    )
                ),
                enabledBorder: OutlineInputBorder(

                  borderSide: BorderSide(
                    color: colorPage.secondarycolor,
                  ),
                  borderRadius: BorderRadius.circular(width*0.03),

                )
            ),
          ),
          SizedBox(height: width*0.05,),
          InkWell(
            onTap: () async {

              FirebaseAuth.instance.signInWithEmailAndPassword(
                email: userController.text.trim(),
                password: passwordController.text,
              ).then((value) async {
                SharedPreferences pref=await SharedPreferences.getInstance();
                
                var userData = await FirebaseFirestore.instance.collection('user').where('email',isEqualTo: userController.text).get();
                
                print(userData.docs[0]['Fullname']);
                
                pref.setInt("login1", 1);
                pref.setString("login", "1");
                pref.setBool("login", true);
                pref.setString("namess", userController.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));

              }).catchError((error){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
              });
              
              
              
            },
            child: Container(
              height: width*0.13,
              width: width*0.6,
              decoration: BoxDecoration(
                  border: Border.all(color: colorPage.secondarycolor),
                  borderRadius: BorderRadius.circular(width*0.06),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                     Container(
                      child: SvgPicture.asset(imagePage.lock),),

                  // SizedBox(width: width*0.01,),
                  Text("Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: width*0.04,
                        color: colorPage.secondarycolor
                    ),),
                  SizedBox(width: width*0.05,)
                ],
              ),

            ),
          ),
          SizedBox(height: width*0.05,),
          InkWell(
            onTap: (){
              signInWithGoogle(context);
            },
            child: Container(
              height: width*0.13,
              width: width*0.6,
              decoration: BoxDecoration(
                // color:Colors.blue,
                border: Border.all(color: colorPage.secondarycolor),
                borderRadius: BorderRadius.circular(width*0.06),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(width*0.02),
                    child: Container(
                      child: SvgPicture.asset(imagePage.ggl),),
                  ),
                  // SizedBox(width: width*0.03,),
                  Text("Sign in with Google",
                    style:TextStyle(
                        color: colorPage.secondarycolor,
                      fontWeight: FontWeight.w500,
                      fontSize: width*0.04,
                    ) ,),
                  SizedBox(width: width*0.05,)
                ],
              ),
            ),
          ),
          SizedBox(height: width*0.05,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>phoneNumber(),));
            },
            child: Container(
              height: width*0.13,
              width: width*0.6,
              decoration: BoxDecoration(
                // color:Colors.blue,=
                border: Border.all(color: colorPage.secondarycolor),
                borderRadius: BorderRadius.circular(width*0.06),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: SvgPicture.asset(imagePage.phone),),
                  // SizedBox(width: width*0.01,),
                  Text("OTP sign in",
                    style:TextStyle(
                      color: colorPage.secondarycolor,
                      fontWeight: FontWeight.w500,
                      fontSize: width*0.04,
                    ) ,),
                  SizedBox(width: width*0.05,)
                ],
              ),
            ),
          ),
          SizedBox(height: width*0.1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don’t have an account ?",
                style: TextStyle(
                    fontSize: width*0.03,
                    color: colorPage.secondarycolor
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signup(gsignIn: false,email: '', name: '', photo: '',),));
                },
                child: Text(" Create Now",
                  style: TextStyle(
                      fontSize: width*0.037,
                      fontWeight: FontWeight.w400,
                      color: colorPage.secondarycolor
                  ),),
              )
            ],
          )
      ]),),
    );
  }
}


signInWithGoogle(context) async {

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  final userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
  User? user = userCredential.user;
  // FirebaseFirestore.instance.collection("user").add({
  // "email":googleUser?.email,
  // "name":googleUser?.displayName,
  // "photo":googleUser?.photoUrl,
  //
  // }).then((value){
  var data = await  FirebaseFirestore.instance.collection('user').where('email',isEqualTo: user?.email).get();
    if(data.docs.isNotEmpty){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => homePage(),), (route) => false);
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => signup(gsignIn: true,email: user!.email.toString(), name: user!.displayName.toString(), photo: user.photoURL.toString(),),), );
    }

  // });


  print(user!.displayName);
  print(user!.email);
  print(user!.photoURL);



}

