import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Auth/home_page.dart';
import 'package:crud/Auth/phone_number.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/intro/login_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class signup extends StatefulWidget {
  final String name;
  final String email;
  final bool gsignIn;
  final String photo;
  const signup({Key? key, required this.gsignIn, required this.email, required this.name, required this.photo}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var gender=[
    "Male",
    "Female"
  ];
  String? valueChoose;
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController dobController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  bool toggle=false;
  var file;
  String imgurl = 'https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=';
  pickFile(ImageSource) async{
    final imageFile=await ImagePicker.platform.pickImage(source:ImageSource);
    file=File(imageFile!.path);
    if(mounted){
      print(file);
      setState(() {
        file=File(imageFile.path);
      });
      uploadfile();
    }
  }
  uploadfile() async {
    var uploadtask=await FirebaseStorage.instance.ref("user").child(DateTime.now().toString()).putFile(file,
        SettableMetadata(contentType: "image/jpg"));

    var geturl=await uploadtask.ref.getDownloadURL();
    imgurl = geturl;
    setState(() {

    });
    print(geturl);
  }
  @override
  void initState() {

    if(widget.gsignIn==true){
      emailController.text = widget.email;
      nameController.text=widget.name;
      imgurl=widget.photo;
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  colorPage.primaryColor,
appBar: AppBar(
  elevation: 0,
  centerTitle: true,
  title: Text("User Registration",
    style: TextStyle(
        color: colorPage.color3
    ),),
  leading: InkWell(
    onTap: (){
      Navigator.pop(context);
    },
    child: Container(
      height: width*0.02,
      width: width*0.02,
      child: Center(child: SvgPicture.asset(imagePage.arrow,),
      ),
    ),
  ),

  backgroundColor:colorPage.primaryColor,
),
      body: Padding(padding: EdgeInsets.all(width*0.05),
      child: SingleChildScrollView(
        child: Column(
     children: [
         Column(
           children: [
                Stack(
                 children: [
                   file!=null?CircleAvatar(
                     radius: 50,
                     backgroundImage: FileImage(file),
                   ):
                   CircleAvatar(
                     backgroundImage: NetworkImage(imgurl),
                     radius: 50,
                   ),
                   Positioned(
                       bottom: 0,
                       right: 0,
                       child: InkWell(
                         onTap: (){
                     showCupertinoModalPopup(
                         context: context,
                         builder: (BuildContext context){
                           return CupertinoActionSheet(
                             actions: [
                               CupertinoActionSheetAction(
                                   onPressed:(){
                                     pickFile(ImageSource.gallery);
                                     Navigator.pop(context);
                                   },
                                   isDefaultAction: true,
                                   child: Text("Photo Gallery",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontSize: width*0.05
                                   ),)),
                               CupertinoActionSheetAction(
                                   onPressed: (){
                                     pickFile(ImageSource.camera);
                                     Navigator.pop(context);
                                   },
                                   child: Text("Camera",
                                   style: TextStyle(
                                     fontSize: width*0.05
                                   ),))
                             ],
                             cancelButton: CupertinoActionSheetAction(
                                 onPressed: (){
                                   Navigator.pop(context);
                                 },
                                 child: Text("Cancel",
                                 style: TextStyle(
                                   fontWeight: FontWeight.w600
                                 ),)),
                           );
                         });
                         },
                         child: Container(
                           height: width*0.07,
                             width: width*0.07,
                             child: SvgPicture.asset(imagePage.edit)),
                       ))

                 ],
               ),


           ],
         ),
         SizedBox(height: width*0.05,),
         TextFormField(
           controller: nameController,
           keyboardType: TextInputType.text,
           textInputAction: TextInputAction.done,
           style: TextStyle(
               fontSize: width*0.04,
               fontWeight: FontWeight.w500
           ),
           decoration:
           InputDecoration(
               labelText: "Full Name",
               labelStyle: TextStyle(
                   fontSize: width*0.04,
                   fontWeight: FontWeight.w400,
                   color: colorPage.color6
               ),
               filled: true,
               fillColor: colorPage.color5,
               hintText: "Enter your full name",
               suffixIcon: Container(
                 height: width*0.009,
                 width: width*0.009,
                 margin: EdgeInsets.all(width*0.03),
                 child:SvgPicture.asset(imagePage.person,) ,
               ),
               hintStyle: TextStyle(
                   fontSize: width*0.03,
                   fontWeight: FontWeight.w700
               ),
               enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: colorPage.primaryColor,
                   ),
                   borderRadius: BorderRadius.circular(width*0.03)
               )
           ),
         ),
         SizedBox(height: width*0.05,),
         TextFormField(
           readOnly: widget.gsignIn,
           controller: emailController,
           keyboardType: TextInputType.emailAddress,
           textInputAction: TextInputAction.done,
           style: TextStyle(
               fontSize: width*0.04,
               fontWeight: FontWeight.w500
           ),
           decoration:
           InputDecoration(

               labelText: "Valid Email",
               labelStyle: TextStyle(
                   fontSize: width*0.04,
                   fontWeight: FontWeight.w400,
                   color: colorPage.color6
               ),
               filled: true,
               fillColor: colorPage.color5,
               hintText: "Enter your Email Address",
               suffixIcon: Container(
                 height: width*0.009,
                 width: width*0.009,
                 margin: EdgeInsets.all(width*0.03),
                 child:SvgPicture.asset(imagePage.mail,) ,
               ),
               hintStyle: TextStyle(
                   fontSize: width*0.03,
                   fontWeight: FontWeight.w700
               ),
               enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: colorPage.primaryColor,
                   ),
                   borderRadius: BorderRadius.circular(width*0.03)
               )
           ),
         ),
         SizedBox(height: width*0.05,),
         TextFormField(
           controller:passwordController ,
           keyboardType: TextInputType.text,
           textInputAction: TextInputAction.done,
           style: TextStyle(
               fontSize: width*0.04,
               fontWeight: FontWeight.w500
           ),
           decoration:
           InputDecoration(
               labelText: "Password",
               labelStyle: TextStyle(
                   fontSize: width*0.04,
                   fontWeight: FontWeight.w400,
                   color: colorPage.color6
               ),
               filled: true,
               fillColor: colorPage.color5,
               hintText: "Enter your Password",
               suffixIcon: Container(
                 height: width*0.009,
                 width: width*0.009,
                 margin: EdgeInsets.all(width*0.03),
                 child:SvgPicture.asset(imagePage.lock1,) ,
               ),
               hintStyle: TextStyle(
                   fontSize: width*0.03,
                   fontWeight: FontWeight.w700
               ),
               enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: colorPage.primaryColor,
                   ),
                   borderRadius: BorderRadius.circular(width*0.03)
               )
           ),
         ),
         SizedBox(height: width*0.05,),
         TextFormField(
           controller:confirmpasswordController ,
           keyboardType: TextInputType.text,
           textInputAction: TextInputAction.done,
           style: TextStyle(
               fontSize: width*0.04,
               fontWeight: FontWeight.w500
           ),
           decoration:
           InputDecoration(
               labelText: "Confirm Password",
               labelStyle: TextStyle(
                   fontSize: width*0.04,
                   fontWeight: FontWeight.w400,
                   color: colorPage.color6
               ),
               filled: true,
               fillColor: colorPage.color5,
               hintText: "Enter your Password",
               suffixIcon: Container(
                 height: width*0.009,
                 width: width*0.009,
                 margin: EdgeInsets.all(width*0.03),
                 child:SvgPicture.asset(imagePage.lock1,) ,
               ),
               hintStyle: TextStyle(
                   fontSize: width*0.03,
                   fontWeight: FontWeight.w700
               ),
               enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: colorPage.primaryColor,
                   ),
                   borderRadius: BorderRadius.circular(width*0.03)
               )
           ),
         ),
         SizedBox(height: width*0.17,),
         InkWell(
           onTap: () async {
             SharedPreferences pref=await SharedPreferences.getInstance();
             pref.setString("namess", nameController.text);
             Map<String,dynamic>signup={
               "Fullname":nameController.text,
               "Validemail":emailController.text,
               "password":passwordController.text,
               "Confirmpassword":confirmpasswordController.text,
               'image':imgurl
             };
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text,
            ).then((value) {
              FirebaseFirestore.instance.collection("user").doc(emailController.text).set(signup);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>homePage(),));


            }).catchError((error){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
            });

             // FirebaseFirestore.instance.collection("user").add(signup);
             print(signup);
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
                     fontWeight: FontWeight.w600,
                     fontSize: width*0.04,
                     color: colorPage.secondarycolor
                 ),),
             ),
           ),
         ),
         SizedBox(height: width*0.2,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Already have an Account",
               style: TextStyle(
                   fontSize: width*0.03,
                   color: colorPage.secondarycolor
               ),
             ),
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => loginSignup(),));
               },
               child: Text("Login?",
                 style: TextStyle(
                     fontSize: width*0.037,
                     fontWeight: FontWeight.w400,
                     color: colorPage.secondarycolor
                 ),),
             )
           ],
         )
     ],
        ),
      ),
      ),
    );
  }
}
