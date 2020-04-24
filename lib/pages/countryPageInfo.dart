import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';
var commaSeparated = NepaliNumberFormat(
  decimalDigits: 0,
);

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
        Text('Cases : '+ commaSeparated.format(info['cases'].toString()),style: TextStyle(color: Colors.red[400] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Today Cases : '+ commaSeparated.format(info['todayCases'].toString()),style: TextStyle(color: Colors.red[300] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Deaths : '+ commaSeparated.format(info['deaths'].toString()),style: TextStyle(color: Colors.grey[500] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Today Deaths : '+ commaSeparated.format(info['todayDeaths'].toString()),style: TextStyle(color: Colors.grey[400] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Recovered : '+ commaSeparated.format(info['recovered'].toString()),style: TextStyle(color: Colors.green[600] ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Active : '+ commaSeparated.format(info['active'].toString()),style: TextStyle(color: Colors.blueAccent ,fontWeight: FontWeight.bold,fontSize: 20),),
        SizedBox(height: 10,),
        Text('Critical : '+ commaSeparated.format(info['critical'].toString()),style: TextStyle(color: Colors.orange ,fontWeight: FontWeight.bold,fontSize: 20),),
      ],
    );
  }
}