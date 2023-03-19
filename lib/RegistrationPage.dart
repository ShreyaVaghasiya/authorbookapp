import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notekeeper/ModelClass.dart';

import 'Collection.dart';
import 'Utils.dart';
class Register_Page extends StatefulWidget {
  const Register_Page({Key? key}) : super(key: key);

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff867070),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();

        },icon: Icon(CupertinoIcons.back,size: 25,),),
        title: Text("Register",style: GoogleFonts.lora(
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.white,
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: h/2.2,
              width: w,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff867070)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 2
                  )
                ],
                color: Colors.white
              ),
              child:Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 40.0,left: 20,bottom: 10),
                      child: Text("Author Name",style: GoogleFonts.lato(
                        fontSize: 18,
                        color: CupertinoColors.black,
                        fontWeight: FontWeight.w600,

                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: AppUtil.authorController,

                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xff867070),
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: "Enter Author Name",
                        hintStyle: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 40.0,left: 20,bottom: 10),
                      child: Text("Book Name",style: GoogleFonts.lato(
                        fontSize: 18,
                        color: CupertinoColors.black,
                        fontWeight: FontWeight.w600,

                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: AppUtil.bookController,

                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xff867070),
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: "Enter book Name",
                        hintStyle: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              var authors = AuthorData(
                  book: AppUtil.bookController.text, name: AppUtil.authorController.text);
              AuthHelper.instance.insertData(authors);
              AppUtil.authorController.clear();
              AppUtil.bookController.clear();
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: h/15,
              width: w/1.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Color(0xff867070)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                    )
                  ],
                  color: Color(0xff867070)
              ),
              child: Center(
                child: InkWell(
                  onTap: (){

                  },
                  child: Text("Submit",style: GoogleFonts.lato(
                    fontSize: 22,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.white
                  ),),
                ),
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
