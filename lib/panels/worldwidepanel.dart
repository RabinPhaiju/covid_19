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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2),
            children: <Widget>[
              StatusPanel(
                title: 'CONFIRMED',
                panelColor: Theme.of(context).brightness == Brightness.light?Colors.red[100]:Colors.red[200],
                textColor: Colors.red,
                count: worldData['cases'].toString(),
              ),
              StatusPanel(
                title: 'ACTIVE',
                panelColor: Theme.of(context).brightness == Brightness.light?Colors.blue[100]:Colors.blue[200],
                textColor: Colors.blue[800],
                count: worldData['active'].toString(),
              ),
              StatusPanel(
                title: 'Today Cases',
                panelColor: Theme.of(context).brightness == Brightness.light?Colors.orange[100]:Colors.orange[200],
                textColor: Colors.orange[800],
                count: worldData['todayCases'].toString(),
              ),
              StatusPanel(
                title: 'RECOVERED',
                panelColor: Theme.of(context).brightness == Brightness.light?Colors.green[100]:Colors.green[200],
                textColor: Colors.green[800],
                count: worldData['recovered'].toString(),
              ),
              StatusPanel(
                title: 'DEATHS',
                panelColor: Theme.of(context).brightness == Brightness.light?Colors.blueGrey[100]:Colors.blueGrey[200],
                textColor: Colors.blueGrey[800],
                count: worldData['deaths'].toString(),
              ),
              StatusPanel(
                title: 'Today Deaths',
                panelColor: Theme.of(context).brightness == Brightness.light?Colors.brown[100]:Colors.brown[200],
                textColor: Colors.brown[800],
                count: worldData['todayDeaths'].toString(),
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
          Text(count,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),)
        ],
      ),
    );
  }
}

