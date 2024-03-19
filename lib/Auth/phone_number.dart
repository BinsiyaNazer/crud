import 'package:country_code_picker/country_code_picker.dart';
import 'package:crud/Auth/otp.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class phoneNumber extends StatefulWidget {
  const phoneNumber({Key? key}) : super(key: key);

  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

class _phoneNumberState extends State<phoneNumber> {
  TextEditingController numberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Enter Phone Number",
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
                image:DecorationImage(image: AssetImage(imagePage.phone1,),fit: BoxFit.fill)
            ),

          ),
          SizedBox(height: width*0.05,),
          TextFormField(
            controller: numberController,
            keyboardType:  TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            textInputAction: TextInputAction.done,
            style: TextStyle(
                fontSize: width*0.04,
                fontWeight: FontWeight.w500
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                counterText: "",
                prefixIcon: CountryCodePicker(
                  initialSelection: "IN",
                ),
                labelText: "Phone Number",
                labelStyle: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w400,
                    color: colorPage.color3
                ),
                hintText: "Enter your number",
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
          SizedBox(height: width*0.08,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>otp(),));
            },
            child: Container(
              height: width*0.13,
              width: width*0.6,
              decoration: BoxDecoration(
                  border: Border.all(color: colorPage.secondarycolor),
                  borderRadius: BorderRadius.circular(width*0.06)
              ),
              child: Center(
                child: Text("Sent OTP",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width*0.04,
                      color: colorPage.secondarycolor
                  ),),
              ),
            ),
          ),
          SizedBox(height: width*0.56,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign in with",
                style: TextStyle(
                    fontSize: width*0.03,
                    color: colorPage.secondarycolor
                ),
              ),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => login4(),));
                },
                child: Text(" Another Method?",
                  style: TextStyle(
                      fontSize: width*0.037,
                      fontWeight: FontWeight.w400,
                      color: colorPage.secondarycolor
                  ),),
              )
            ],
          )
        ],
    
      ),),
    );
  }
}
