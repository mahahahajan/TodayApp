import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:today_app/components/custom_today_card_widget.dart';
import 'package:today_app/constants.dart';
import 'package:today_app/secrets.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:location/location.dart';

// import 'package:weather_icons_example/util.dart';

class CustomWeatherObj {
  double? lat;
  double? long;
  int? temp;

  // currWeather
}

class WeatherComponent extends StatefulWidget {
  @override
  State<WeatherComponent> createState() => _WeatherComponentState();
}

class _WeatherComponentState extends State<WeatherComponent> {
  //TODO: Clean up all this code -- I dont know which variables are still needed
  double? lat;

  double? long;
  int? temp = 90;

  WeatherFactory wf = new WeatherFactory(openWeatherApiKey);

  IconData currWeatherIcon = WeatherIcons.alien;

  String weatherDescription = "";

  CustomWeatherObjectWithFields myWeather = CustomWeatherObjectWithFields();

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  //#52A5DF
  Future<void> getLocationData() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    lat = _locationData.latitude;
    long = _locationData.longitude;
    // print(_locationData);
  }

  void getWeatherData() async {
    try {
      await getLocationData();
      print("Lat is $lat");
      print("Long is $long");
      Weather w = await wf.currentWeatherByLocation(lat!, long!);
      print(w.weatherDescription);
      myWeather = getWeatherFields(w);
      print(myWeather);
      setState(() {
        myWeather = myWeather;
      });
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO:see if you can make this structure a little clearers
    return CustomTodayCard(
      cardColor: weatherCardBackgroundColor,
      elevation: 10,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      borderRadius: 25,
      child: Center(
        child: myWeather.isNull() // if Null, show  loading indication
            ? Container(
                height: cardHeight,
                child: SpinKitRing(
                  color: Colors.white,
                ),
              )
            : Row(
                // This means myWeather is not Null, which means we got the right data
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    // width: 181.5,
                    height: cardHeight,
                    // margin: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.all(0),
                    child: Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.fill,
                                child: BoxedIcon(
                                  myWeather.weatherIcon,
                                  size: cardHeight / 2.1,
                                  color: myWeather.iconColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: myWeather.temperature.toString(),
                                        style: degreesNumberTextStyle,
                                      ),
                                      TextSpan(
                                        text: "˚f",
                                        style: degreesUnitTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                myWeather.weatherDescription,
                                style: weatherDescriptionStyle,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Column(
                    children: [
                      Text(
                        "OOTD:",
                        style: outfitLabelTextStyle,
                      ),
                      Text(
                        myWeather.outfitTitle,
                        style: outfitItemsTextStyle,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Image(
                                image: AssetImage(myWeather.outfitTop),
                              ),
                            ),
                            WidgetSpan(
                              child: Image(
                                image: AssetImage(myWeather.outfitBottom),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
