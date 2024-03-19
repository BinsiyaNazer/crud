import 'dart:convert';

import 'package:crud/Auth/update_profile.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart'as http;

import '../main.dart';

class postalCodes extends StatefulWidget {
  const postalCodes({Key? key}) : super(key: key);

  @override
  State<postalCodes> createState() => _postalCodesState();
}

class _postalCodesState extends State<postalCodes> {
  String pinCode="";
  List apidata=[];
  List PostOffice=[];
  getpostalcodes(String pinCode) async {
   var data=await  http.get(Uri.parse("https://api.postalpincode.in/pincode/$pinCode"));
   print(data.body);
   
   apidata = jsonDecode(data.body);
   // print(apidata);
   if(data!=null){
     PostOffice=apidata[0]["PostOffice"];
     print(PostOffice);
     setState(() {
     });
   }
   
  }
  int selectIndex=0;
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Postal Codes",
          style: TextStyle(
              color: colorPage.color3
          ),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context,MaterialPageRoute(builder: (context) => updateProfile(),));
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
      body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height*1,
                  width: width*1,
                  padding: EdgeInsets.all(width*0.05),
                  color: colorPage.primaryColor,
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       Container(
                         height: width*0.15,
                         width: width*0.85,
                         child: TextFormField(
                           onChanged: (value){
                             setState(() {
                           pinCode=value;
                             });
                           },
                           controller: searchController,
                           keyboardType: TextInputType.number,
                           textInputAction: TextInputAction.done,

                           style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: width*0.05
                           ),
                           decoration: InputDecoration(
                               filled: true,
                               fillColor: colorPage.color9,
                               prefixIcon: Container(
                                 height: width*0.02,
                                 width: width*0.02,
                                 child: Center(child: SvgPicture.asset(imagePage.search1,color: Colors.blue,),),),
                               labelStyle: TextStyle(
                                 fontWeight: FontWeight.w600,),
                               hintText: "Enter pincode",
                               hintStyle: TextStyle(
                                   fontSize: width*0.05,
                                   color: colorPage.color3,
                                   fontWeight: FontWeight.w500
                               ),
                               border:
                               OutlineInputBorder(
                                   borderSide: BorderSide.none,

                                   borderRadius: BorderRadius.circular(width*0.03)
                               )
                           ),
                         ),
                       ),
                       SizedBox(height: width*0.05,),
                       InkWell(
                         onTap: (){
                      getpostalcodes(pinCode);
                         },
                         child: Container(
                           height: width*0.05,
                           width: width*0.19,
                           child: Text("Button"),

                         ),
                       ),
                       Container(
                         height: height*1,
                         width: width*1,
                         color: colorPage.primaryColor,
                         child: ListView.builder(
                           itemCount: PostOffice.length,
                           scrollDirection: Axis.vertical,
                           physics: BouncingScrollPhysics(),
                           shrinkWrap: true,
                           itemBuilder: (BuildContext context, int index) {
                             return  Container(
                               height: width*0.2,
                               width: width*1,
                               margin: EdgeInsets.all( width*0.03),
                               decoration: BoxDecoration(
                                   color: colorPage.color9,
                                   borderRadius: BorderRadius.circular(width*0.03),
                               ),
                               child: Padding(
                                 padding:  EdgeInsets.all(width*0.03),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     SizedBox(height: width*0.02,),
                                     SizedBox(width: width*0.03,),
                                     Text("PostOffice:${PostOffice[index]["Name"]}",
                                     style: TextStyle(
                                       fontSize: width*0.04,
                                       fontWeight: FontWeight.w600
                                     ),),
                                     SizedBox(height: width*0.02,),
                                     Text("PinCode:${PostOffice[index]["Pincode"]}",
                                       style: TextStyle(
                                           fontSize: width*0.04,
                                           fontWeight: FontWeight.w600
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             );
                           },


                         ),
                       )
                     ],
                   ),
                 ),
                )
              ],
            ),
          )),
          );
  }
}
