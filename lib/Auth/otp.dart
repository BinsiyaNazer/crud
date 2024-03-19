import 'package:crud/Auth/home_page.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../main.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPage.primaryColor,
     appBar: AppBar(
       elevation: 0,
       centerTitle: true,
       title: Text("Verify OTP",
         style: TextStyle(
             color: colorPage.color3
         ),),
       leading: InkWell(
         onTap: (){
           Navigator.pop(context,MaterialPageRoute(builder: (context) => otp(),));
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
          Container(
            height: width*0.7,
            width: width*1,
            padding: EdgeInsets.only(left: width*0.07),
            decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage(imagePage.otpimg,),fit: BoxFit.fill)
            ),
          ),
          SizedBox(height: width*0.05,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OTP has been sent to ",
                style: TextStyle(
                    color: colorPage.color6,
                    fontWeight: FontWeight.w500
                ),),
              Text("*****634",
                style: TextStyle(
                    color: colorPage.secondarycolor,
                    fontWeight: FontWeight.w500
                ),),
             SizedBox(width: width*0.03,),
             Container(
               height: width*0.05,
               width: width*0.05,
               child:  SvgPicture.asset(imagePage.edit1),
             )
            ],
          ),
          SizedBox(height: width*0.05,),
          FractionallySizedBox(
            child: Pinput(
              length: 6,
              closeKeyboardWhenCompleted: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Resend code in "),
              Countdown(
                  seconds: 60,
                  build:( p0,p1){
                    return Text("$p1");
                  }

              )
            ],
          ),
          SizedBox(height: width*0.08,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>homePage(),));
            },
            child: Container(
              height: width*0.13,
              width: width*0.6,
              decoration: BoxDecoration(
                  border: Border.all(color: colorPage.secondarycolor),
                  borderRadius: BorderRadius.circular(width*0.06)
              ),
              child: Center(
                child: Text("Verify",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width*0.04,
                      color: colorPage.secondarycolor
                  ),),
              ),
            ),
          ),
          SizedBox(height: width*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Haven't got the confirmation code yet?",
                style: TextStyle(
                    fontSize: width*0.03,
                    color: colorPage.color3
                ),
              ),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => login4(),));
                },
                child: Text(" Resend",
                  style: TextStyle(
                      fontSize: width*0.037,
                      fontWeight: FontWeight.w400,
                      color: colorPage.secondarycolor
                  ),),
              )
            ],
          ),
          SizedBox(height: width*0.3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Try Another",
                style: TextStyle(
                    fontSize: width*0.03,
                    color: colorPage.color3
                ),
              ),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => login4(),));
                },
                child: Text(" Method?",
                  style: TextStyle(
                      fontSize: width*0.037,
                      fontWeight: FontWeight.w400,
                      color: colorPage.secondarycolor
                  ),),
              )
            ],
          ),


        ],

      ),),
    );
  }
}
