import 'package:covid19/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQs"),),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        child: ListView.builder(
            itemCount: DataSource.questionAnswers.length,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
            children: <Widget>[
              Text(DataSource.questionAnswers[index]['answer'])
            ],),
          );
        }),
      ),
    );
  }
}
