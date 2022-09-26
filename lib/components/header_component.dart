import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  String currTime = "";

  HeaderComponent({Key? key}) : super(key: key);

  //TODO: Give this a real time
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
    var now = DateTime.now();
    currTime = getTimeOfDay(now.hour);
    print(currTime);
    return Row(children: <Widget>[
      Expanded(
          child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Text(
          'Good $currTime Pulkit',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      )),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 20.0, 0),
        child: AvatarImageComponent(),
      )
    ]);
  }
}

class AvatarImageComponent extends StatelessWidget {
  const AvatarImageComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => print("Settings")),
      child: AvatarGlow(
          glowColor: Colors.white,
          endRadius: 48,
          duration: Duration(milliseconds: 5500),
          showTwoGlows: false,
          repeat: true,
          animate: true,
          curve: Curves.easeInOutSine,
          repeatPauseDuration: Duration(seconds: 5),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage:
                  AssetImage('images/DefaultImages/defaultAvatar.png'),
              radius: 30.0,
            ),
          )),
    );
  }
}
