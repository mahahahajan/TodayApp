import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:today_app/components/today_card_component.dart';
import 'package:today_app/constants.dart';
import 'package:today_app/secrets.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';

// import 'package:weather_icons_example/util.dart';

class WeatherComponent extends StatelessWidget {
  double? lat;
  double? long;
  WeatherFactory wf = new WeatherFactory(openWeatherApiKey);
  IconData currWeatherIcon = WeatherIcons.alien;
  String weatherDescription = "Idk yet";

  //#52A5DF

  WeatherComponent(double? lat, double? long) {
    this.lat = lat;
    this.long = long;
  }

  getWeatherData() async {
    print("Lat is $lat");
    print("Long is $long");
    // Weather w = await wf.currentWeatherByLocation(lat!, long!);
    // print(w);
    getWeatherIcon(312);
  }

// 201	Thunderstorm	thunderstorm with rain	 11d
// 202	Thunderstorm	thunderstorm with heavy rain	 11d
// 210	Thunderstorm	light thunderstorm	 11d
// 211	Thunderstorm	thunderstorm	 11d
// 212	Thunderstorm	heavy thunderstorm	 11d
// 221	Thunderstorm	ragged thunderstorm	 11d
// 230	Thunderstorm	thunderstorm with light drizzle	 11d
// 231	Thunderstorm	thunderstorm with drizzle	 11d
// 232	Thunderstorm	thunderstorm with heavy drizzle	 11d

  void getWeatherIcon(int conditionCode) {
    switch (conditionCode) {
      case 200:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'thunderstorm with light rain';
        }
        break;
      case 201:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'thunderstorm with rain';
        }
        break;
      case 202:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'thunderstorm with heavy rain';
        }
        break;
      case 210:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'light thunderstorm';
        }
        break;
      case 211:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'thunderstorm';
        }
        break;
      case 212:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'heavy thunderstorm';
        }
        break;
      case 221:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'ragged thunderstorm';
        }
        break;
      case 230:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'thunderstorm with light drizzle';
        }
        break;
      case 231:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'thunderstorm with drizzle';
        }
        break;
      case 232:
        {
          currWeatherIcon = WeatherIcons.thunderstorm;
          weatherDescription = 'thunderstorm with heavy drizzle';
        }
        break;
      case 300:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'light intensity drizzle';
        }
        break;
      case 301:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'drizzle';
        }
        break;
      case 302:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'heavy intensity drizzle';
        }
        break;
      case 310:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'light intensity drizzle rain';
        }
        break;
      case 311:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'drizzle rain';
        }
        break;
      case 312:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'heavy intensity drizzle rain';
        }
        break;
      case 313:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'shower rain and drizzle';
        }
        break;
      case 314:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'heavy shower rain and drizzle';
        }
        break;
      case 321:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'shower drizzle';
        }
        break;
      case 500:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'light rain';
        }
        break;
      case 501:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'moderate rain';
        }
        break;
      case 502:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'heavy intensity rain';
        }
        break;
      case 503:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'very heavy rain';
        }
        break;
      case 504:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'extreme rain';
        }
        break;
      case 511:
        {
          currWeatherIcon = WeatherIcons.rain_wind;
          weatherDescription = 'freezing rain';
        }
        break;
      case 520:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'light intensity shower rain';
        }
        break;
      case 521:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'shower rain';
        }
        break;
      case 522:
        {
          currWeatherIcon = WeatherIcons.rain;
          weatherDescription = 'heavy intensity shower rain';
        }
        break;
      case 531:
        {
          currWeatherIcon = WeatherIcons.showers;
          weatherDescription = 'ragged shower rain';
        }
        break;
      case 600:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'light snow';
        }
        break;
      case 601:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'snow';
        }
        break;
      case 602:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'heavy snow';
        }
        break;
      case 611:
        {
          currWeatherIcon = WeatherIcons.sleet;
          weatherDescription = 'Sleet';
        }
        break;
      case 612:
        {
          currWeatherIcon = WeatherIcons.sleet;
          weatherDescription = 'light shower sleet';
        }
        break;
      case 613:
        {
          currWeatherIcon = WeatherIcons.sleet;
          weatherDescription = 'shower sleet';
        }
        break;
      case 615:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'light rain and snow';
        }
        break;
      case 616:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'Rain and Snow';
        }
        break;
      case 620:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'Light shower snow';
        }
        break;
      case 621:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'Shower snow';
        }
        break;
      case 622:
        {
          currWeatherIcon = WeatherIcons.snow;
          weatherDescription = 'Heavy shower snow';
        }
        break;
      case 701:
        {
          currWeatherIcon = WeatherIcons.fog;
          weatherDescription = 'Mist';
        }
        break;
      case 711:
        {
          currWeatherIcon = WeatherIcons.smoke;
          weatherDescription = 'Smoke';
        }
        break;
      case 721:
        {
          currWeatherIcon = WeatherIcons.smog;
          weatherDescription = 'Haze';
        }
        break;
      case 731:
        {
          currWeatherIcon = WeatherIcons.dust;
          weatherDescription = 'Sand/dust whirls';
        }
        break;
      case 741:
        {
          currWeatherIcon = WeatherIcons.fog;
          weatherDescription = 'Fog';
        }
        break;
      case 751:
        {
          currWeatherIcon = WeatherIcons.sleet;
          weatherDescription = 'Sand';
        }
        break;
      case 761:
        {
          currWeatherIcon = WeatherIcons.dust;
          weatherDescription = 'Dust';
        }
        break;
      case 762:
        {
          currWeatherIcon = WeatherIcons.dust;
          weatherDescription = 'Volcanic Ash';
        }
        break;
      case 771:
        {
          currWeatherIcon = WeatherIcons.tsunami;
          weatherDescription = 'Squalls';
        }
        break;
      case 781:
        {
          currWeatherIcon = WeatherIcons.tornado;
          weatherDescription = 'Tornado';
        }
        break;
      case 800:
        {
          currWeatherIcon = WeatherIcons.moon_new;
          weatherDescription = 'Clear Sky';
        }
        break;
      case 801:
        {
          currWeatherIcon = WeatherIcons.cloud;
          weatherDescription = 'Few Clouds (10-25%)';
        }
        break;
      case 802:
        {
          currWeatherIcon = WeatherIcons.cloud;
          weatherDescription = 'Scattered Clouds (25%-50%)';
        }
        break;
      case 803:
        {
          currWeatherIcon = WeatherIcons.cloudy;
          weatherDescription = 'Broken Clouds (50%-85%)';
        }
        break;
      case 804:
        {
          currWeatherIcon = WeatherIcons.cloudy;
          weatherDescription = 'Overcast Clouds (85%-100%)';
        }
        break;
      default:
        {
          currWeatherIcon = WeatherIcons.thermometer;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    getWeatherData();
    return TodayCard(
      cardColor: weatherCardBackgroundColor,
      elevation: 10,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      borderRadius: 25,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              // width: 181.5,
              height: 133,
              // margin: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(0),
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        BoxedIcon(
                          currWeatherIcon,
                          size: 70,
                          // color: Colors.yellow,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: RichText(
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
                        ),
                      ],
                    ),
                    Text(
                      weatherDescription,
                      style: weatherDescriptionStyle,
                      softWrap: true,
                    ),
                  ],
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
