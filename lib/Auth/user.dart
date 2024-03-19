import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Auth/add_user.dart';
import 'package:crud/Auth/edit_user.dart';
import 'package:crud/Auth/id_page.dart';
import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/intro/login_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => addUser(),));
        },
        backgroundColor: colorPage.secondarycolor,
        child: Icon(Icons.add),),
      backgroundColor: colorPage.primaryColor,
      appBar: AppBar(
        backgroundColor: colorPage.primaryColor,
        elevation: 0,
        title: Text("Hello, User",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width*0.05,
              color: colorPage.color3
          ),),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePage.profile),
            radius: 20,
          ),
          SizedBox(width: width*0.02,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => loginSignup(),));
            },
            child: Container(
              height: width*0.1,
                width: width*0.1,
                child: SvgPicture.asset(imagePage.logout)),
          )
        ],

      ),
      body: Padding(padding: EdgeInsets.all(width*0.02),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(right: width*0.6),
                child: Text("Current Users",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: width*0.05
                ),),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("user").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  var data=snapshot.data?.docs;
                  return Container(
                    height: height*1,
                    width: width*1,
                    color: colorPage.primaryColor,
                    child: ListView.builder(
                      itemCount: data?.length,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => idPage(
                              id: data[index].id,
                            ),));
                          },
                          child: Container(
                            height: width*0.25,
                            width: width*0.2,
                            margin: EdgeInsets.all( width*0.03),
                            decoration: BoxDecoration(
                                color: colorPage.color8,
                                // image: DecorationImage(image: AssetImage(imagePage.circleavathar)),
                                borderRadius: BorderRadius.circular(width*0.03),
                                boxShadow: [
                                  BoxShadow( color: Colors.black.withOpacity(0.15),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      offset: Offset(0, 4))
                                ]
                            ),
                           child:Container(
                             height: width*0.2,
                             width: width*1,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(width*0.03),
                               color: colorPage.color8
                             ),
                             child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 ListTile(
                                   leading: CircleAvatar(
                                     backgroundImage: AssetImage(imagePage.circleavathar),radius: 30,backgroundColor: colorPage.color9,
                                   ),
                                   title:
                                   Text(data?[index]["Fullname"],
                                   style: TextStyle(
                                     fontSize: width*0.04,
                                     fontWeight: FontWeight.w700
                                   ),),

                                   subtitle: Text(data![index].id,
                                   style: TextStyle(
                                     color: colorPage.color3,
                                     fontSize: width*0.027
                                   ),),
                                   trailing: Container(
                                     height: width*0.1,
                                     width: width*0.15,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         InkWell(
                                           onTap: (){
                                             showCupertinoModalPopup(
                                               context: context,
                                               builder: (context) {
                                                 return CupertinoAlertDialog(
                                                   title: Text("Are you Sure You Want to delete User?"),
                                                   actions: [
                                                     Column(
                                                       children: [
                                                         CupertinoDialogAction(
                                                           child: Text("Yes",
                                                           style: TextStyle(
                                                             color: colorPage.color4
                                                           ),),

                                                           onPressed: (){
                                                             FirebaseFirestore.instance.collection("user").doc(data[index].id).delete();
                                                            Navigator.pop(context);
                                                           },
                                                         ),

                                                         Divider(),
                                                         CupertinoDialogAction(
                                                           child: Text("Cancel",
                                                             style: TextStyle(
                                                                 color: colorPage.color12
                                                             ),),
                                                           onPressed: (){
                                                             Navigator.pop(context);
                                                           },
                                                         )
                                                       ],
                                                     )
                                                   ],
                                                 );
                                               },
                                             );
                                           },

                                           child: Container(
                                             height: width*0.06,
                                             width: width*0.06,
                                             child:  SvgPicture.asset(imagePage.delete,fit: BoxFit.fill,),
                                           ),
                                         ),
                                         InkWell(
                                           onTap: (){
                                             if(
                                             data[index].id!=""
                                             ){
                                               Navigator.push(context, MaterialPageRoute(builder: (context) => editUser(id:data[index].id ,),));
                                             }

                                           },
                                           child: Container(
                                             height: width*0.06,
                                             width: width*0.06,
                                             child:  SvgPicture.asset(imagePage.edit1,fit: BoxFit.fill,),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   ),
                               ],
                             ),
                           )
                           ),
                        );
                      },


                    ),
                  );
                }
              )],
          ),
        ),),
    );
  }
}
