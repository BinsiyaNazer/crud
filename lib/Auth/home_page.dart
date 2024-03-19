import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/Auth/banner.dart';
import 'package:crud/Auth/postal_codes.dart';
import 'package:crud/Auth/update_profile.dart';
import 'package:crud/Auth/user.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/intro/login_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentIndex=0;
   String name="";
   names() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    name=pref.getString("namess")??"user";
    setState(() {

    });
   }
   @override
  void initState() {
    // TODO: implement initState
     names();
    super.initState();
  }
  int count=0;
  List images=["assets/images/img1.png","assets/images/img2.png","assets/images/img1.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPage.primaryColor,
appBar: AppBar(
  backgroundColor: colorPage.primaryColor,
 elevation: 0,
  title: Text("Hello $name",
  style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: width*0.05,
    color: colorPage.color3
  ),),
  actions: [
    InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => updateProfile(),));
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePage.profile),
        radius: 20,
      ),
    ),
    SizedBox(width: width*0.02,),
    InkWell(
      onTap: () async {
        SharedPreferences pref=await SharedPreferences.getInstance();
        await pref.remove("login");
        await pref.remove("login1");
        FirebaseAuth.instance.signOut();
        GoogleSignIn().signOut();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => loginSignup(),), (route) => false);
      },
        child: SvgPicture.asset(imagePage.logout))
  ],

),
      body: Padding(padding: EdgeInsets.all(width*0.05),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              autoPlayAnimationDuration: Duration(
                  milliseconds: 100
              ),
              onPageChanged: (index, reason) {
                currentIndex=index;
                setState(() {
                });
              },
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                height: width*0.5,
                width: width*1,
                margin: EdgeInsets.only(right: width*0.03),

                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(image: AssetImage(images[index]),fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(width*0.03),

                ),
              );
            },

          ),
          SizedBox(
            height: width*0.05,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: images.length,
            effect: JumpingDotEffect(
                dotColor:Colors.black ,
                dotHeight: width*0.03,
                dotWidth: width*0.03,
                activeDotColor: Colors.blue
            ),
          ),

SizedBox(height: width*0.05,),
             Row(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => user(),));
                   },
                   child: Container(
                   height: width*0.4,
                     width: width*0.4,
                     decoration: BoxDecoration(
                       color: colorPage.primaryColor,
                       borderRadius: BorderRadius.circular(width*0.06),
                       boxShadow: [
                         BoxShadow(
                           color: colorPage.color11,
                           spreadRadius: 2,
                           offset: Offset(0,4),
                           blurRadius: 4,
                         )
                       ]
                     ),
                     child:
                     Column(
                       children: [Padding(padding: EdgeInsets.all(width*0.03)),
                         Container(
                           height: width*0.2,
                           width: width*0.2,
                           decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage(imagePage.img3))
                           ),),
                         SizedBox(height: width*0.03,),
                         Text("CRUD",
                           style: TextStyle(
                               fontSize: width*0.05,
                               fontWeight: FontWeight.w500
                           ),),
                       ],
                     )

                   ),
                 ),
                 SizedBox(width: width*0.05,),
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => banner(),));
                   },
                   child: Container(
                       height: width*0.4,
                       width: width*0.4,
                       decoration: BoxDecoration(
                           color: colorPage.primaryColor,
                           borderRadius: BorderRadius.circular(width*0.06),
                           boxShadow: [
                             BoxShadow(
                               color: colorPage.color11,
                               spreadRadius: 2,
                               offset: Offset(0,4),
                               blurRadius: 4,
                             )
                           ]
                       ),
                       child:
                       Column(
                         children: [
                           Container(
                             height: width*0.39,
                             width: width*0.35,
                             decoration: BoxDecoration(
                                 image: DecorationImage(image: AssetImage(imagePage.img4)
                             ),),

                           )],
                       )

                   ),
                 ),
               ],
             ),

          SizedBox(height: width*0.1,),
          Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => postalCodes(),));
                },
                child: Container(
                    height: width*0.4,
                    width: width*0.4,
                    decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        borderRadius: BorderRadius.circular(width*0.06),
                        boxShadow: [
                          BoxShadow(
                            color: colorPage.color11,
                            spreadRadius: 2,
                            offset: Offset(0,4),
                            blurRadius: 4,
                          )
                        ]
                    ),
                    child:
                    Column(
                      children: [
                        Container(
                          height: width*0.26,
                          width: width*0.27,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(imagePage.img5))
                          ),),
                        SizedBox(height: width*0.03,),
                        Text("API",
                          style: TextStyle(
                              fontSize: width*0.06,
                              fontWeight: FontWeight.w500
                          ),),
                      ],
                    )

                ),
              ),
              Container(
                height: width*0.4,
                width: width*0.4,
              )
            ],
          ),

          SizedBox(width: width*0.08,),

        ],
      ),),
    );
  }
}
