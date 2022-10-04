import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  String currTime = "";

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
    // print(currTime);
    return Row(children: <Widget>[
      Expanded(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
        child: Text(
          'Good $currTime Pulkit',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
        ),
      )),
      const Padding(
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
          duration: const Duration(milliseconds: 5500),
          showTwoGlows: false,
          repeat: true,
          animate: true,
          curve: Curves.easeInOutSine,
          repeatPauseDuration: const Duration(seconds: 5),
          child: Material(
            elevation: 8,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage:
                  const AssetImage('images/DefaultImages/defaultAvatar.png'),
              radius: 30.0,
            ),
          )),
    );
  }
}
