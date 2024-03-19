import 'dart:io';

import 'package:crud/Auth/edit_user.dart';
import 'package:crud/Auth/home_page.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class updateProfile extends StatefulWidget {
  const updateProfile({Key? key}) : super(key: key);

  @override
  State<updateProfile> createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {
  TextEditingController userController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  bool visibility=true;
  final formKey=GlobalKey<FormState>();
  bool check1=false;
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
    }
    uploadfile();
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
        title: Text("Profile",
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
        child: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
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
                                            Navigator.pop(context,MaterialPageRoute(builder: (context) => updateProfile(),));
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
                                                      Navigator.pop(context,MaterialPageRoute(builder: (context) => updateProfile(),));
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
                      fontWeight: FontWeight.w500,
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w700,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w500,
                      color: colorPage.color3
                  ),
                  hintText: "Enter your Email Address",
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
            SizedBox(height: width*0.17,),
            InkWell(
              onTap: (){
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Are you Sure \n You Want to Update Details?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400
                        ),),
                      actions: [
                        Column(
                          children: [
                            CupertinoDialogAction(
                              child: Text("Confirm"),
                              onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));
                              },),
                            Divider(),
                            CupertinoDialogAction(
                              child: Text("Cancel",
                                style: TextStyle(
                                    color: colorPage.color4
                                ),),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            )
                          ],
                        )
                      ],
                    );
                  },);
              },
              child: Container(
                height: width*0.14,
                width: width*0.6,
                decoration: BoxDecoration(
                    border: Border.all(color: colorPage.secondarycolor),
                    borderRadius: BorderRadius.circular(width*0.08)
                ),
                child: Center(
                  child: Text("Update",
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
    );
  }
}
