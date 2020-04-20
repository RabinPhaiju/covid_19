import 'dart:convert';

import 'package:covid19/datasource.dart';
import 'package:covid19/pages/countryPage.dart';
import 'package:covid19/panels/infoPanel.dart';
import 'package:covid19/panels/mosteffectedcountries.dart';
import 'package:covid19/panels/worldwidepanel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData()async{
  http.Response response = await http.get('https://corona.lmao.ninja/v2/all');

  setState(() {
    worldData = json.decode(response.body);
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
    fetchWorldWideData();
    fetchCountryData();
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
        title: Text("COVID-19"),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                color: Colors.orange[100],
                child: Text(DataSource.quote, style: TextStyle(color: Colors.orange[800],fontWeight: FontWeight.bold),),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Worldwide',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryBlack,
                          ),
                          child: Text('Regional',style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold),)),
                    ),
                  ],
                ),
              ),
              worldData==null?CircularProgressIndicator():WorldwidePanel(worldData: worldData,),
              PieChart(dataMap: {
                'Confirmed':worldData['cases'].toDouble(),
                'Active':worldData['active'].toDouble(),
                'Recovered':worldData['recovered'].toDouble(),
                'Deaths':worldData['deaths'].toDouble(),
              },
              colorList: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.grey[900],
              ],),
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
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
