import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map nepalData;
  const Country({Key key, this.nepalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
//                      Text(nepalData['country']),
//                      Image.network(nepalData['flag']),
              Text('Nepal',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold, color: Colors.black),),
              Image.network(nepalData['countryInfo']['flag'],width: 30,),

            ],
          ),
          SizedBox(width: 20,),
          Column(
            children: <Widget>[
              Text('Confirmed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.red),),
              Text(nepalData['cases'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.red),),
            ],
          ),
          SizedBox(width: 15,),
          Column(
            children: <Widget>[
              Text('Active',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.blue),),
              Text(nepalData['active'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.blue),),
            ],
          ),
          SizedBox(width: 15,),
          Column(
            children: <Widget>[
              Text('Recovered',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.green),),
              Text(nepalData['recovered'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.green),),
            ],
          ),
          SizedBox(width: 15,),
          Column(
            children: <Widget>[
              Text('Deaths',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black54),),
              Text(nepalData['deaths'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black54),),
            ],
          ),
        ],
      ),
    );
  }
}

