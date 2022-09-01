import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:today_app/components/today_card_component.dart';
import 'package:today_app/constants.dart';

import 'package:weather_icons/weather_icons.dart';
// import 'package:weather_icons_example/util.dart';

class WeatherComponent extends StatelessWidget {
  const WeatherComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodayCard(
      cardColor: weatherCardBackgroundColor,
      elevation: 10,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      borderRadius: 25,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              // width: 181.5,
              height: 133,
              // margin: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoxedIcon(
                      WeatherIcons.day_sunny,
                      size: 75,
                      color: Colors.yellow,
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "90",
                            style: degreesNumberTextStyle,
                          ),
                          TextSpan(
                            text: "˚f",
                            style: degreesUnitTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            //TODO: Check if there's a way to combine these later -- dont need 2 containers
            Column(
              children: [
                Text(
                  "OOTD:",
                  style: outfitLabelTextStyle,
                ),
                Text(
                  "Hoodie",
                  style: outfitItemsTextStyle,
                ),
                //TODO: Make this dynamic, duh
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Image(
                          image: AssetImage(
                              'images/png-64/hoodie-64x64-455155.png'),
                        ),
                      ),
                      WidgetSpan(
                        child: Image(
                          image: AssetImage(
                              'images/png-64/jeans-64x64-455157.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ), //This is for the weather text (degrees in F)
        //TODO: Fix this text to match with the weather
        //Contains text with info on what to wear
      ),
    );
  }
}
