import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Auth/signup.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  State<addUser> createState() => _addUserState();
}

class _addUserState extends State<addUser> {

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPage.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Add User",
          style: TextStyle(
              color: colorPage.color3
          ),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context,MaterialPageRoute(builder: (context) => addUser(),));
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
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [

                        CircleAvatar(
                          backgroundImage: NetworkImage(imgurl),
                          radius: 50,
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: (){
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              pickFile(ImageSource.camera);
                                              Navigator.pop(context,MaterialPageRoute(builder: (context) => addUser(),));
                                            },
                                            child: Column(
                                              children: [
                                                Text("Choose a file form",
                                                  style: TextStyle(
                                                      fontSize: width*0.04
                                                  ),),
                                                SizedBox(height: width*0.04,),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: width*0.1,
                                                      width: width*0.1,
                                                      decoration: BoxDecoration(
                                                          color: colorPage.primaryColor,
                                                          borderRadius: BorderRadius.circular(width*0.04),
                                                          border: Border.all(color: colorPage.color4)
                                                      ),
                                                      child: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                                                    ),
                                                    SizedBox(width: width*0.05,),
                                                    InkWell(
                                                      onTap: (){
                                                        pickFile(ImageSource.gallery);
                                                        Navigator.pop(context,MaterialPageRoute(builder: (context) => addUser(),));
                                                      },
                                                      child: Container(
                                                        height: width*0.1,
                                                        width: width*0.1,
                                                        decoration: BoxDecoration(
                                                            color: colorPage.primaryColor,
                                                            borderRadius: BorderRadius.circular(width*0.04),
                                                            border: Border.all(color: colorPage.secondarycolor)
                                                        ),
                                                        child: Icon(Icons.image,color: Colors.black,),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: SvgPicture.asset(imagePage.edit),
                            ))

                      ],
                    ),
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
                onTap: (){
                  Map<String,dynamic>adduser={
                    "Fullname":nameController.text,
                    "Validemail":emailController.text,
                    "password":passwordController.text,
                    "Confirmpassword":confirmpasswordController.text,
                    'image':imgurl
                  };
                  FirebaseFirestore.instance.collection("user").add(adduser);
              print(adduser);
                },
                child: Container(
                  height: width*0.1,
                  width: width*0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorPage.secondarycolor),
                      borderRadius: BorderRadius.circular(width*0.04)
                  ),
                  child: Center(
                    child: Text("Add User",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width*0.04,
                          color: colorPage.secondarycolor
                      ),),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
