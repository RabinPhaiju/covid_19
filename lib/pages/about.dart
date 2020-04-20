import 'package:covid19/datasource.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About"),),
      backgroundColor: primaryBlack,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 100),
              child: Image.network('https://pbs.twimg.com/profile_images/1201698553149550592/2-Q2Du8O_400x400.jpg',width: 150),
            ),
            Text('Rabin Phaiju',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                launch('https://github.com/rabinphaiju');
              },
                child:  Text('Github',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 15),),
            ),
            SizedBox(height: 10,),
            Text('This aplication provides information about Corona Virus (Covid-19).'
                ' Source of data "https://corona.lmao.ninja".',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                launch('https://www.who.int/health-topics/coronavirus');
              },
              child:  Text('For More information visit Here',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 15),),
            ),
            SizedBox(height: 10,),

          ],
        )
      ),
    );
  }
}
