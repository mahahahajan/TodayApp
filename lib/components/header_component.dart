import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  String currTime = "";

  HeaderComponent({Key? key}) : super(key: key);

  String getTimeOfDay(int time) {
    if (3 < time && time < 12) {
      return 'Morning';
    } else if (12 < time && time < 16) {
      return 'Afternoon';
    } else if (16 < time && time < 19) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    currTime = getTimeOfDay(17);
    print(currTime);
    return Row(children: <Widget>[
      Expanded(
          child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Text(
          'Good $currTime Pulkit',
          textScaleFactor: 2,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      )),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 20.0, 0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/9956077?v=4"),
          radius: 25.0,
        ),
      )
    ]);
  }
}
