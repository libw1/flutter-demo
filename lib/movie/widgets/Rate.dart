import 'package:flutter/material.dart';


class Rate extends StatelessWidget{
  final data;
  final count;
  const Rate({Key key, this.data, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List calcRateList(){
      var totalRate = data['details'].values.reduce((a, b) => a + b);
      return List.generate(5, (int index) {
        return {
          'title': '${5 - index}星',
          'value': data['details']['${5 - index}'] /(totalRate == 0 ? 1 : totalRate),
        };
      });
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: calcRateList().map((item) =>Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Text(item['title']),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 2,
                    child: LinearProgressIndicator(
                      value: item['value'],
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    width: 60,
                    child: Text(
                      (100 * item['value']).toStringAsFixed(2) + '%',
                    ),
                  ),
                ],
              )).toList()
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  child: Text(data['average'].toString()),
                ),
                Text(count.toString() + '人')
              ],
            ),
          )
        ],
      ),
    );
  }

}