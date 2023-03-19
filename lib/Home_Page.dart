import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Collection.dart';
import 'Utils.dart';
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff867070),
        title: Text("Authors",style: GoogleFonts.lora(
          fontSize: 23,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.white,
        ),),
      ),
     body:  Center(
       child: StreamBuilder(
         stream: FirebaseFirestore.instance.collection('Author').snapshots(),
         builder: (context, snapshot) {
           if (snapshot.hasError) {
             print("Error : ${snapshot.hasError}");
             return const Text("Something  Wrong!");
           } else if (snapshot.connectionState ==
               ConnectionState.waiting) {
             return const Center(
               child: CircularProgressIndicator(),
             );
           } else {
             return Padding(
               padding: const EdgeInsets.only(top: 10.0),
               child:  GridView.builder(
                   physics: const BouncingScrollPhysics(),
                   itemCount: snapshot.data!.docs.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   crossAxisSpacing: 4.0,
                   mainAxisSpacing: 4.0
               ),   itemBuilder: (context,index) {
                 AppUtil.authorList = snapshot.data!.docs;
                     return  Container(
                       margin: EdgeInsets.all(10),
                       height: h/20,
                       width: w/2.5,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         border: Border.all(color: Color(0xff867070)),
                         boxShadow: [
                           BoxShadow(
                               blurRadius: 1,
                               spreadRadius: 2
                           )
                         ],
                         color: Color(0xffF5EBEB),
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Align(
                             alignment: Alignment.topRight,
                               child: IconButton(onPressed: (){ AuthHelper.instance.deleteData(index: index);}, icon: Icon(CupertinoIcons.delete_solid,size: 20,),)),
                           Padding(padding: EdgeInsets.all(10)),


                           Text("${AppUtil.authorList[index]['book']}",style: GoogleFonts.lato(
                             fontSize: 18,
                             letterSpacing: 1,
                             color: Color(0xff37306B),
                             fontWeight: FontWeight.w600
                           ),),
                           Padding(padding: EdgeInsets.all(20)),
                           Align(
                             alignment: Alignment.bottomRight,
                             child: Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Text("- ${AppUtil.authorList[index]['name']}",style: GoogleFonts.lato(
                                   fontSize: 15,
                                   letterSpacing: 1,
                                   fontWeight: FontWeight.w600
                               ),),
                             ),
                           ),
                         ],
                       ),
                     );
               }

                  ),


             );
           }
         },
       ),
     ),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Color(0xff867070),
       onPressed: () {
         setState(() {
           AppUtil.authorController.clear();
           AppUtil.bookController.clear();
         });
           Navigator.of(context).pushNamed('register');
       },
       child: Icon(CupertinoIcons.add_circled_solid,size: 30,color: CupertinoColors.white,),
     ),
      backgroundColor: Colors.white,
    );
  }
}
