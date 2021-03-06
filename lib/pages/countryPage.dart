import 'package:covid19/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'countryPageInfo.dart';
import 'package:nepali_utils/nepali_utils.dart';
var commaSeparated = NepaliNumberFormat(
  decimalDigits: 0,
);

class CountryPage extends StatelessWidget {
  final List countryData;
  const CountryPage({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);
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
        title: countryData!=null? Container(
          child: Text('Country Stats ( '+  countryData.length.toString() +' )',),
        ):Text('Country Stats'),

      ),
      body: countryData==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPageInfo(info:countryData[index])));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              height: 100,
              color: Colors.black12,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 5),
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
                        Text('CONFIRMED: '+ commaSeparated.format(countryData[index]['cases'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                        Text('ACTIVE: '+ commaSeparated.format(countryData[index]['active'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                        Text('RECOVERD: '+ commaSeparated.format(countryData[index]['recovered'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                        Text('DEATHS: '+ commaSeparated.format(countryData[index]['deaths'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

                      ],
                    ),
                  ),)
                ],
              ),
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}
