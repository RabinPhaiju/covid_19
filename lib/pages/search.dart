import 'package:covid19/datasource.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate{
  final List countryList;

  Search(this.countryList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryBlack,
      brightness: DynamicTheme.of(context).brightness
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
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?
    countryList:
    countryList.where((element)=>element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
                  Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                  Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60,),

                ],
              ),
            ),
            Expanded(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('CONFIRMED: '+ suggestionList[index]['cases'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                  Text('ACTIVE: '+ suggestionList[index]['active'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                  Text('RECOVERD: '+ suggestionList[index]['recovered'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                  Text('DEATHS: '+ suggestionList[index]['deaths'].toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

                ],
              ),
            ),)
          ],
        ),
      );
    });
  }

}