import 'package:covid19/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get(
        'https://corona.lmao.ninja/v2/countries?yesterday=false&sort=cases');

    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),

            onPressed: (){
            if(countryData!=null){ showSearch(context: context, delegate: Search(countryData)); }
          },

          )
        ],
        title: Text(
          'Country Stats',
        ),
      ),
      body: countryData==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 130,
            color: Colors.black12,
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60,),

                    ],
                  ),
                ),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('CONFIRMED: '+ countryData[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      Text('ACTIVE: '+ countryData[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      Text('RECOVERD: '+ countryData[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                      Text('DEATHS: '+ countryData[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

                    ],
                  ),
                ),)
              ],
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}
