import 'package:crud/Auth/otp.dart';
import 'package:crud/Auth/postal_codes.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class banner extends StatefulWidget {
  const banner({Key? key}) : super(key: key);

  @override
  State<banner> createState() => _bannerState();
}

class _bannerState extends State<banner> {
  TextEditingController userController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Banner",
          style: TextStyle(
              color: colorPage.color3
          ),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context,MaterialPageRoute(builder: (context) => postalCodes(),));
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
body: SingleChildScrollView(
  child:   Padding(
    padding:  EdgeInsets.all(width*0.05),
    child: Column(
      children: [
        Container(
          height: width*0.5,
          width: width*0.87,
          decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage(imagePage.frame),fit: BoxFit.fill)
          ),
        ),
        SizedBox(height: width*0.05,),
        Container(
          height: width*0.2,
          width:width*0.87,
          child: TextFormField(
            controller: userController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: width*0.04,
              fontWeight: FontWeight.w700,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w700,
                    color: colorPage.color3
                ),
                hintText: "Banner 4",
                hintStyle: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w700,
                  color: colorPage.color3
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
        ),
        SizedBox(height: width*0.05,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => otp(),));
          },
          child: Container(
            height: width*0.14,
            width: width*0.6,
            decoration: BoxDecoration(
                border: Border.all(color: colorPage.secondarycolor),
                borderRadius: BorderRadius.circular(width*0.02)
            ),
            child: Center(
              child: Text("Upload Banner",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: width*0.04,
                    color: colorPage.secondarycolor
                ),),
            ),
          ),
        ),
        SizedBox(height: width*0.05,),
        Container(
              height: width*0.25,
              width: width*0.87,
              margin: EdgeInsets.all( width*0.03),
              decoration: BoxDecoration(
                  color: colorPage.color13,
                  // image: DecorationImage(image: AssetImage(imagePage.circleavathar)),
                  borderRadius: BorderRadius.circular(width*0.03),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.15),
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: Offset(0, 4))
                  ]
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        height: width*0.20,
                        width: width*0.26,
                        decoration: BoxDecoration(
                          image:  DecorationImage(image: AssetImage(imagePage.img1)),
                        ),
                      ),
                      SizedBox(width: width*0.05,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: width*0.07)),
                          Text("Banner 1",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width*0.05,
                                color:colorPage.color10
                            ),),

                          Text("2 May",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: width*0.035
                            ),),
                        ],
                      ),
                    ],
                  ),

                  SvgPicture.asset(imagePage.dlt),

                ],
              )
          ),
        SizedBox(height: width*0.05,),
        Container(
            height: width*0.25,
            width: width*0.87,
            margin: EdgeInsets.all( width*0.03),
            decoration: BoxDecoration(
                color: colorPage.color13,
                // image: DecorationImage(image: AssetImage(imagePage.circleavathar)),
                borderRadius: BorderRadius.circular(width*0.03),
                boxShadow: [
                  BoxShadow( color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(0, 4))
                ]
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      height: width*0.20,
                      width: width*0.26,
                      decoration: BoxDecoration(
                        image:  DecorationImage(image: AssetImage(imagePage.img2)),
                      ),
                    ),
                    SizedBox(width: width*0.05,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: width*0.07)),
                        Text("Banner 2",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.05,
                              color:colorPage.color10
                          ),),

                        Text("2 May",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.035
                          ),),
                      ],
                    ),
                  ],
                ),

                SvgPicture.asset(imagePage.dlt),

              ],
            )
        ),
        SizedBox(height: width*0.05,),
        Container(
            height: width*0.25,
            width: width*0.87,
            margin: EdgeInsets.all( width*0.03),
            decoration: BoxDecoration(
                color: colorPage.color13,
                // image: DecorationImage(image: AssetImage(imagePage.circleavathar)),
                borderRadius: BorderRadius.circular(width*0.03),
                boxShadow: [
                  BoxShadow( color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(0, 4))
                ]
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      height: width*0.20,
                      width: width*0.26,
                      decoration: BoxDecoration(
                        image:  DecorationImage(image: AssetImage(imagePage.img1)),
                      ),
                    ),
                    SizedBox(width: width*0.05,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: width*0.07)),
                        Text("Banner 3",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.05,
                            color:colorPage.color10
                          ),),

                        Text("2 May",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.035
                          ),),
                      ],
                    ),
                  ],
                ),

                SvgPicture.asset(imagePage.dlt),

              ],
            )
        ),

      ],
    ),
  ),
)
    );
  }
}
