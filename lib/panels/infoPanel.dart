import 'package:covid19/datasource.dart';
import 'package:covid19/pages/about.dart';
import 'package:covid19/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
//          GestureDetector(
//            onTap: () {
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => FAQPage()));
//            },
//            child: Container(
//                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                margin: EdgeInsets.all(5),
//                color: primaryBlack,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text("FAQS", style: TextStyle(color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 20),),
//                    Icon(Icons.arrow_forward, color: Colors.white,)
//                  ],
//                )
//            ),
//          ),
          GestureDetector(
            onTap: () {
              launch('https://covid19responsefund.org/');
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                margin: EdgeInsets.all(5),
                color: primaryBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Donate", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),
                    Icon(Icons.arrow_forward, color: Colors.white,)
                  ],
                )
            ),
          ),
          GestureDetector(
            onTap: () {
              launch(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                margin: EdgeInsets.all(5),
                color: primaryBlack,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Myth Buster", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),
                    Icon(Icons.arrow_forward, color: Colors.white,)
                  ],
                )
            ),
          ),
//          GestureDetector(
//            onTap: () {
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => About()));
//            },
//            child: Container(
//                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                margin: EdgeInsets.all(5),
//                color: primaryBlack,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text("About", style: TextStyle(color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 20),),
//                    Icon(Icons.arrow_forward, color: Colors.white,)
//                  ],
//                )
//            ),
//          ),
        ],
      ),
    );
  }

}