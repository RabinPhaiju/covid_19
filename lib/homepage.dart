import 'dart:convert';
import 'package:covid19/pages/about.dart';
import 'package:covid19/pages/bouncyPageRoute.dart';
import 'package:covid19/pages/faqs.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:covid19/datasource.dart';
import 'package:covid19/pages/countryInfo.dart';
import 'package:covid19/pages/countryPage.dart';
import 'package:covid19/panels/infoPanel.dart';
import 'package:covid19/panels/mosteffectedcountries.dart';
import 'package:covid19/panels/worldwidepanel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pos = 0;
  Map worldData;

  fetchWorldWideData()async{
  http.Response response = await http.get('https://corona.lmao.ninja/v2/all');

  setState(() {
    worldData = json.decode(response.body);
  });
}

  Map nepalData;
  fetchNepalData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/nepal?yesterday=false&strict=false');


    setState(() {
      nepalData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?yesterday=false&sort=cases');

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData()async{
    fetchNepalData();
    fetchCountryData();
    fetchWorldWideData();
//    print('Refresh');
  }

@override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon:Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight),onPressed:(){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          },)
        ],
        title: Text("COVID-19 ( #Stay Home )"),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:10,top: 5),
                color: Theme.of(context).brightness == Brightness.light?Colors.grey[200]:primaryBlack,
//                child: Text(DataSource.quote, style: TextStyle(color: Colors.orange[800],fontWeight: FontWeight.bold),),
                  child:
              nepalData==null?Container(child:Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  CircularProgressIndicator(),
                  SizedBox(width: 5,),
                  Text('Loading data',style: TextStyle(fontSize: 15,color: Colors.grey),)





                ],
              ) ):Country(nepalData:nepalData),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Worldwide',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage(countryData: countryData)));
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:Colors.grey[800],
                          ),
                          child: Text('Regional',style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold),)),
                    ),
                  ],
                ),
              ),
              worldData==null?Container(

              ):WorldwidePanel(worldData: worldData,),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Most Affected Country',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              countryData==null?Container():MostAffectedPanel(countryData:countryData),
              SizedBox(height: 15,),
              InfoPanel(),
              SizedBox(height: 20,),
              Center(child: Text("WE ARE TOGETHER IN THE FIGHT",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar(

        showUnselectedLabels: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        style: SnakeBarStyle.pinned,
        backgroundColor: Theme.of(context).brightness == Brightness.light?Colors.grey:Colors.grey[700],
        currentIndex: _pos,
        padding: EdgeInsets.all(2),
        selectedItemColor: Colors.grey[100],
        onPositionChanged: (index){
          setState(() {
//            _pos = index;
          });
          if(index==3){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));
          }else if(index==2){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CountryPage(countryData: countryData)));
          }else if(index==1){
//            Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQPage()));
              Navigator.push(context, BouncyPageRoute(widget:FAQPage()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer),title: Text('FAQs')),
          BottomNavigationBarItem(icon: Icon(Icons.assistant_photo),title: Text('Regional')),
          BottomNavigationBarItem(icon: Icon(Icons.straighten),title: Text('About')),
        ],
      ),
    );
  }

}
