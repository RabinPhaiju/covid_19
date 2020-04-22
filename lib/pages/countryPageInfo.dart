import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryPageInfo extends StatelessWidget {

 final Map info;

  const CountryPageInfo({Key key, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info['country']),
      ),
      body: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).brightness==Brightness.dark?Colors.grey[800]:Colors.grey[200],
              ),
              child: SingleChildScrollView(

                child: Column(
                  children: <Widget>[
                    MediaQuery.of(context).orientation==Orientation.landscape?Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(info['countryInfo']['flag'],height: 200,width: 200,),
                        SizedBox(width: 40,),
                        countryList(),
                      ],
                    ):Column(
                      children: <Widget>[
                        Image.network(info['countryInfo']['flag'],height: 200,width: 200,),
                        countryList(),
                      ],
                    ),

                  ],
                ),
              ),
            ),




    );
  }


  countryList() {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5,),
        Text('Cases : '+ info['cases'].toString(),style: TextStyle(color: Colors.red[400] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Today Cases : '+ info['todayCases'].toString(),style: TextStyle(color: Colors.red[300] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Deaths : '+ info['deaths'].toString(),style: TextStyle(color: Colors.grey[500] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Today Deaths : '+ info['todayDeaths'].toString(),style: TextStyle(color: Colors.grey[400] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Recovered : '+ info['recovered'].toString(),style: TextStyle(color: Colors.green[600] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Active : '+ info['active'].toString(),style: TextStyle(color: Colors.blueAccent ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Critical : '+ info['critical'].toString(),style: TextStyle(color: Colors.orange ,fontWeight: FontWeight.bold,fontSize: 20),),
      ],
    );
  }
}