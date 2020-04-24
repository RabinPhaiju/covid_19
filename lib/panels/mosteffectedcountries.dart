import 'package:covid19/pages/countryPageInfo.dart';
import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';
var commaSeparated = NepaliNumberFormat(
  decimalDigits: 0,
);

class MostAffectedPanel extends StatelessWidget {
  final List countryData;
  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 200,
        color: Colors.black12,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPageInfo(info:countryData[index])));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: <Widget>[
                  Image.network(countryData[index]['countryInfo']['flag'],height: 30,),
                  SizedBox(width: 10,),
                  Text(countryData[index]['country']),
                  SizedBox(width: 10,),
                  Text('Cases: '+ commaSeparated.format(countryData[index]['cases'].toString()),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                  Text(' | Deaths: '+ commaSeparated.format(countryData[index]['deaths'].toString()),style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),)
                ],
              ),

            ),
          );
        },
        itemCount: 20,),
      );

  }
}
