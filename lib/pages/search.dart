import 'package:covid19/datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'countryPageInfo.dart';
import 'package:nepali_utils/nepali_utils.dart';
var commaSeparated = NepaliNumberFormat(
  decimalDigits: 0,
);

class Search extends SearchDelegate{
  final List countryList;

  Search(this.countryList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryBlack,
      brightness: Brightness.dark
//     brightness: DynamicTheme.of(context).brightness
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(icon: Icon(Icons.clear),onPressed: (){
        query='';
      })
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
      Navigator.pop(context);
    },);

  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList =    countryList.where((element)=>element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPageInfo(info:suggestionList[index])));
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
                          Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                          Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60,),

                        ],
                      ),
                    ),

                  Expanded(child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('CONFIRMED: '+ commaSeparated.format(suggestionList[index]['cases'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                        Text('ACTIVE: '+ commaSeparated.format(suggestionList[index]['active'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                        Text('RECOVERD: '+ commaSeparated.format(suggestionList[index]['recovered'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                        Text('DEATHS: '+ commaSeparated.format(suggestionList[index]['deaths'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

                      ],
                    ),
                  ),)
                ],
              ),
            ),
          );
        });

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?
    countryList:
    countryList.where((element)=>element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
      return GestureDetector(
        onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPageInfo(info:suggestionList[index])));
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
                    Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                    Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60,),

                  ],
                ),
              ),
              Expanded(child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('CONFIRMED: '+ commaSeparated.format(suggestionList[index]['cases'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    Text('ACTIVE: '+ commaSeparated.format(suggestionList[index]['active'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                    Text('RECOVERD: '+ commaSeparated.format(suggestionList[index]['recovered'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                    Text('DEATHS: '+ commaSeparated.format(suggestionList[index]['deaths'].toString()),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

                  ],
                ),
              ),)
            ],
          ),
        ),
      );
    });
  }

}