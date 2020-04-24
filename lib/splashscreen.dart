import 'dart:async';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'datasource.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));//replace the current stack page
    });
  }
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness){
        return ThemeData(
          primaryColor: primaryBlack,
          fontFamily: 'Circular',
          brightness: brightness==Brightness.light?Brightness.light:Brightness.dark,
          scaffoldBackgroundColor: brightness==Brightness.dark?Colors.blueGrey[900]:Colors.white,
        );
      },
      themedWidgetBuilder: (context,theme){
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
        ]);
        return Scaffold(
          backgroundColor: primaryBlack,
          body: Center(
            child: Text(
              "Covid-19",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,),
            ),
          ),
        );
      },

    );
  }
}