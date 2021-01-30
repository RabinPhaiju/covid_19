import 'package:covid19/pages/countryPageInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nepali_utils/nepali_utils.dart';
var commaSeparated = NepaliNumberFormat(
  decimalDigits: 0,
);

class Country extends StatelessWidget {
  final Map nepalData;
  const Country({Key key, this.nepalData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPageInfo(info: nepalData,)));},
      child: Container(
      child:SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
              Column(
                children: <Widget>[
//                      Text(nepalData['country']),
//                      Image.network(nepalData['flag']),
                  Text(nepalData['country'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.black:Colors.grey[100]),),
                  Image.network(nepalData['countryInfo']['flag'],width: 25,),

                ],
              ),

            SizedBox(width: 20,),
            Column(
              children: <Widget>[
                Text('Confirmed',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.red),),
                Text(commaSeparated.format(nepalData['cases'].toString()), style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.red),),
              ],
                ),
            SizedBox(width: 15,),
            Column(
              children: <Widget>[
                Text('Active',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.blue),),
                Text(commaSeparated.format(nepalData['active'].toString()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            SizedBox(width: 15,),
            Column(
              children: <Widget>[
                Text('Recovered',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.green),),
                Text(commaSeparated.format(nepalData['recovered'].toString()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.green),),
              ],
            ),
            SizedBox(width: 15,),
            Column(
              children: <Widget>[
                Text('Deaths',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.grey[800]:Colors.grey[400]),),
                Text(commaSeparated.format(nepalData['deaths'].toString()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.grey[800]:Colors.grey[500]),),
              ],
            ),
            SizedBox(width: 15,),
            Column(
              children: <Widget>[
                Text('Critical',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.orange[600]:Colors.orange[600]),),
                Text(commaSeparated.format(nepalData['critical'].toString()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.orange[400]:Colors.orange[600]),),
              ],
            ),
            SizedBox(width: 15,),
            Column(
              children: <Widget>[
                Text('Today Cases',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.red[500]:Colors.red[600]),),
                Text(commaSeparated.format(nepalData['todayCases'].toString()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.red[600]:Colors.red[600]),),
              ],
            ),
            SizedBox(width: 15,),
            Column(
              children: <Widget>[
                Text('Today Deaths',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.grey[800]:Colors.grey[400]),),
                Text(commaSeparated.format(nepalData['todayDeaths'].toString()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light?Colors.black54:Colors.grey[400]),),
              ],
            ),
            SizedBox(width: 15,)
          ],
        ),
      ),
      ),
    );
  }
}

