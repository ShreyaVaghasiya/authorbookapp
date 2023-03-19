import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_Page.dart';
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_Page())));
            }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image(
                image: AssetImage('assets/myimages/5d337da58badd6ce2db0cdb802bbc164_1.png'),
              ),
            ),
          ),
          Text("Author App",style: GoogleFonts.lora(
            color: CupertinoColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
            letterSpacing: 2
          ),)
        ],
      ),
      backgroundColor: CupertinoColors.black,
    );
  }
}
