import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldwidePanel extends StatelessWidget {
final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
            children: <Widget>[
              StatusPanel(
                title: 'CONFIRMED',
                panelColor: Colors.red[100],
                textColor: Colors.red,
                count: worldData['cases'].toString(),
              ),
              StatusPanel(
                title: 'ACTIVE',
                panelColor: Colors.blue[100],
                textColor: Colors.blue,
                count: worldData['active'].toString(),
              ),
              StatusPanel(
                title: 'RECOVERED',
                panelColor: Colors.green[100],
                textColor: Colors.green,
                count: worldData['recovered'].toString(),
              ),
              StatusPanel(
                title: 'DEATHS',
                panelColor: Colors.blueGrey[100],
                textColor: Colors.blueGrey,
                count: worldData['deaths'].toString(),
              ),

            ],
          ),
          Container(
            height: 150,
            child: PieChart(dataMap: {
              'Confirmed':worldData['cases'].toDouble(),
              'Active':worldData['active'].toDouble(),
              'Recovered':worldData['recovered'].toDouble(),
              'Deaths':worldData['deaths'].toDouble(),
            },
              colorList: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.grey[900],
              ],),
          ),
        ],

      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(8),
      height: 50,width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),),
          Text(count,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

