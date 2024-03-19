import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/color_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class idPage extends StatefulWidget {
  final String id;
  const idPage({Key? key, required this.id,}) : super(key: key);


  @override
  State<idPage> createState() => _idPageState();
}

class _idPageState extends State<idPage> {
  Map<String,dynamic>getmap={};
  List getlist=[];
  getData()async{

    DocumentSnapshot data = await  FirebaseFirestore.instance.collection("user").doc(widget.id).get();
    var data1=await FirebaseFirestore.instance.collection("user").get();
    print(data.data());
    getlist=data1.docs;
    setState(() {

    });
   getmap=data.data() as Map<String,dynamic>;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(child: Text(widget.id)),
          Text('==========='),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("user").doc(widget.id).snapshots(),
              builder: (context, snapshot) {
                var data=snapshot.data;
                return Text(data!['Fullname'].toString());
              }
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("user").doc(widget.id).snapshots(), 
              builder: (context, snapshot) {
                var data=snapshot.data;
                return Text(data!['Validemail'].toString());
              },),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("user").doc(widget.id).snapshots(), 
              builder: (context, snapshot) {
                var data=snapshot.data;
                return Text(data!['Confirmpassword'].toString());
              },),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("user").doc(widget.id).snapshots(),
              builder: (context, snapshot) {
                var data=snapshot.data;
                return Text(data!['password'].toString());
              },),

   ElevatedButton(
    onPressed: () {

     getData();
     setState(() {

     });
},
    child: Text('Get'),

   ),
   Text(getmap.toString()),
   // Text(getlist.toString()),
    Column(
       children: [
         StreamBuilder<QuerySnapshot>(
             stream: FirebaseFirestore.instance.collection("user").snapshots(),
             builder: (context, snapshot) {
               return Container(
                 height: height*0.5,
                 width: width*1,
                 color: colorPage.color13,
                 child: ListView.builder(
                     itemCount: getlist.length,
                     scrollDirection: Axis.vertical,
                     physics: BouncingScrollPhysics(),
                     shrinkWrap: true,
                     itemBuilder: (BuildContext context,int index){
                     return ListTile(
                       title: Text(getlist[index]["Fullname"].toString()),



                     );
                     })
               );
             }
         )
       ],
    )



        ],
      ),


    );
  }
}
