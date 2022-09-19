import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
// import 'package:google_fonts/google_fonts.dart';

//Clothes to constants (make my life easy)
const String location = "images/png-64/";
const String jacket = "${location}jacket-64x64-455151.png";
const String hoodie = "${location}hoodie-64x64-455155.png";
const String jeans = "${location}jeans-64x64-455157.png";
const String tshirt = "${location}mens-64x64-455159.png";
const String shorts = "${location}mens-64x64-455160.png";
const String tankTop = "${location}mens-64x64-455161.png";
const String sweater = "${location}sweater-64x64-455167.png";

const String waterCountKey = 'currWaterCount';

//BG for app
// Mudit says: 0C0C0C
// I say 22252A

//DEV: Theme colors
const Color backgroundColor = Color(0xFF22252A);
const Color headerTextColor = Color.fromARGB(255, 213, 213, 222);

//DEV: Weather Colors
const Color thunderstormColor = Color(0xFFB3BCEF);
const Color drizzleColor = Color(0xFF90D4DB);
const Color rainColor = Color(0xFF3AA2EF);
const Color snowColor = Color(0xFFF1F2F5);
const Color tornadoColor = Color(0xFF7D75A2);
const Color squallsColor = Color(0xFF7D75A2);
const Color ashColor = Color(0xFF7D75A2);
const Color dustColor = Color(0xFF7D75A2);
const Color sandColor = Color(0xFF7D75A2);
const Color fogColor = Color(0xFF7D75A2);
const Color hazeColor = Color(0xFF7D75A2);
const Color smokeColor = Color(0xFF8F8F8F);
const Color cloudColor = Colors.grey;
const Color sunnyColor = Color(0xFFFFCC32);

//Mudit Says: 333333
//I say: 333741
//DEV: Card Background Colors
const Color weatherCardBackgroundColor = Color(0xFF333333);
const Color reminderCardBackgroundColor = Colors.blue;

//DEV: Text Styles
const TextStyle degreesNumberTextStyle =
    TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold);
const TextStyle degreesUnitTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w400,
    letterSpacing: -6);
const TextStyle weatherDescriptionStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w200,
);
const TextStyle outfitLabelTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 3);
const TextStyle outfitItemsTextStyle =
    TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);
const TextStyle waterReminderTitleTextStyle =
    TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w800);
const TextStyle waterReminderSubTitleTextStyle =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);
const TextStyle waterReminderCounterTextStyle =
    TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w200);

//DEV: Custom weather object
class CustomWeatherObjectWithFields {
  Color iconColor;
  IconData weatherIcon;
  int temperature;
  String weatherDescription;
  String outfitTitle;
  String outfitTop;
  String outfitBottom;

  CustomWeatherObjectWithFields(
      {this.iconColor = Colors.white,
      this.weatherIcon = WeatherIcons.alien,
      this.temperature = 60,
      this.weatherDescription = "U messed up dummy",
      this.outfitTitle = "Hoodie + Jeans",
      this.outfitTop = "images/png-64/hoodie-64x64-455155.png",
      this.outfitBottom = "images/png-64/hoodie-64x64-455155.png"});

  bool isNull() {
    if (this.weatherDescription != "U messed up dummy" &&
        this.weatherIcon != WeatherIcons.alien) {
      return false;
    } else {
      return true;
    }
  }
}

//DEV: Const function for converting weather info into UI
// 201	Thunderstorm	thunderstorm with rain	 11d
CustomWeatherObjectWithFields getWeatherFields(Weather w) {
  int? conditionCode = w.weatherConditionCode;
  // int? conditionCode = 622;
  int myTemperature = w.tempFeelsLike!.fahrenheit!.toInt();
  // int myTemperature = 90;

  String myWeatherDescription = w.weatherDescription!;

  switch (conditionCode) {
    case 200:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'thunderstorm with light rain';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.lightning,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: sweater,
          outfitBottom: jeans,
        );
      }
      break;
    case 201:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'thunderstorm with rain';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.storm_showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 202:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'thunderstorm with heavy rain';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.thunderstorm,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Umbrella",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 210:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'light thunderstorm';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.storm_showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: sweater,
          outfitBottom: jeans,
        );
      }
      break;
    case 211:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'thunderstorm';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.thunderstorm,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 212:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'heavy thunderstorm';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.thunderstorm,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Big Jacket",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 221:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'ragged thunderstorm';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.lightning,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 230:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'thunderstorm with light drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.storm_showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 231:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'thunderstorm with drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.storm_showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 232:
      {
        // currWeatherIcon = WeatherIcons.thunderstorm;
        // weatherDescription = 'thunderstorm with heavy drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: thunderstormColor,
          weatherIcon: WeatherIcons.storm_showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 300:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'light intensity drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: drizzleColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 301:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: drizzleColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 302:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'heavy intensity drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: drizzleColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 310:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'light intensity drizzle rain';
        return CustomWeatherObjectWithFields(
          iconColor: drizzleColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 311:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'drizzle rain';
        return CustomWeatherObjectWithFields(
          iconColor: drizzleColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: "images/png-64/hoodie-64x64-455155.png",
          outfitBottom: "images/png-64/hoodie-64x64-455155.png",
        );
      }
      break;
    case 312:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'heavy intensity drizzle rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 313:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'shower rain and drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain_mix,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 314:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'heavy shower rain and drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain_mix,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 321:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'shower drizzle';
        return CustomWeatherObjectWithFields(
          iconColor: drizzleColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 500:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'light rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 501:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'moderate rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 502:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'heavy intensity rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Umbrella",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 503:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'very heavy rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 504:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'extreme rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 511:
      {
        // currWeatherIcon = WeatherIcons.rain_wind;
        // weatherDescription = 'freezing rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain_wind,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 520:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'light intensity shower rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 521:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'shower rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 522:
      {
        // currWeatherIcon = WeatherIcons.rain;
        // weatherDescription = 'heavy intensity shower rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.rain,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 531:
      {
        // currWeatherIcon = WeatherIcons.showers;
        // weatherDescription = 'ragged shower rain';
        return CustomWeatherObjectWithFields(
          iconColor: rainColor,
          weatherIcon: WeatherIcons.showers,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 600:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'light snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 601:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 602:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'heavy snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 611:
      {
        // currWeatherIcon = WeatherIcons.sleet;
        // weatherDescription = 'Sleet';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.sleet,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 612:
      {
        // currWeatherIcon = WeatherIcons.sleet;
        // weatherDescription = 'light shower sleet';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.sleet,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 613:
      {
        // currWeatherIcon = WeatherIcons.sleet;
        // weatherDescription = 'shower sleet';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.sleet,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 615:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'light rain and snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 616:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'Rain and Snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Snow Jacket",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 620:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'Light shower snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Wear Gloves",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 621:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'Shower snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Bundle up",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 622:
      {
        // currWeatherIcon = WeatherIcons.snow;
        // weatherDescription = 'Heavy shower snow';
        return CustomWeatherObjectWithFields(
          iconColor: snowColor,
          weatherIcon: WeatherIcons.snow,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Bundle up",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 701:
      {
        //   currWeatherIcon = WeatherIcons.fog;
        // weatherDescription = 'Mist';
        return CustomWeatherObjectWithFields(
          iconColor: hazeColor,
          weatherIcon: WeatherIcons.fog,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 711:
      {
        // currWeatherIcon = WeatherIcons.smoke;
        // weatherDescription = 'Smoke';
        return CustomWeatherObjectWithFields(
          iconColor: smokeColor,
          weatherIcon: WeatherIcons.smoke,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: tshirt,
          outfitBottom: shorts,
        );
      }
      break;
    case 721:
      {
        // currWeatherIcon = WeatherIcons.smog;
        // weatherDescription = 'Haze';
        return CustomWeatherObjectWithFields(
          iconColor: hazeColor,
          weatherIcon: WeatherIcons.smog,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: tshirt,
          outfitBottom: jeans,
        );
      }
      break;
    case 731:
      {
        // currWeatherIcon = WeatherIcons.dust;
        // weatherDescription = 'Sand/dust whirls';
        return CustomWeatherObjectWithFields(
          iconColor: sandColor,
          weatherIcon: WeatherIcons.thunderstorm,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 741:
      {
        //   currWeatherIcon = WeatherIcons.fog;
        // weatherDescription = 'Fog';
        return CustomWeatherObjectWithFields(
          iconColor: fogColor,
          weatherIcon: WeatherIcons.fog,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 751:
      {
        // currWeatherIcon = WeatherIcons.sleet;
        // weatherDescription = 'Sand';
        return CustomWeatherObjectWithFields(
          iconColor: sandColor,
          weatherIcon: WeatherIcons.sleet,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 761:
      {
        // currWeatherIcon = WeatherIcons.dust;
        // weatherDescription = 'Dust';
        return CustomWeatherObjectWithFields(
          iconColor: dustColor,
          weatherIcon: WeatherIcons.dust,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Jacket",
          outfitTop: sweater,
          outfitBottom: jeans,
        );
      }
      break;
    case 762:
      {
        // currWeatherIcon = WeatherIcons.dust;
        // weatherDescription = 'Volcanic Ash';
        return CustomWeatherObjectWithFields(
          iconColor: ashColor,
          weatherIcon: WeatherIcons.volcano,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Sweater",
          outfitTop: sweater,
          outfitBottom: jeans,
        );
      }
      break;
    case 771:
      {
        // currWeatherIcon = WeatherIcons.tsunami;
        // weatherDescription = 'Squalls';
        return CustomWeatherObjectWithFields(
          iconColor: squallsColor,
          weatherIcon: WeatherIcons.hurricane,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Rain Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 781:
      {
        // currWeatherIcon = WeatherIcons.tornado;
        // weatherDescription = 'Tornado';
        return CustomWeatherObjectWithFields(
          iconColor: tornadoColor,
          weatherIcon: WeatherIcons.tornado,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Hide",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 800:
      {
        // currWeatherIcon = WeatherIcons.day_sunny;
        // weatherDescription = 'Clear Sky';
        return CustomWeatherObjectWithFields(
          iconColor: sunnyColor,
          weatherIcon: WeatherIcons.day_sunny,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "T-Shirt",
          outfitTop: tshirt,
          outfitBottom: jeans,
        );
      }
      break;
    case 801:
      {
        // currWeatherIcon = WeatherIcons.cloud;
        // weatherDescription = 'Few Clouds (10-25%)';
        return CustomWeatherObjectWithFields(
          iconColor: cloudColor,
          weatherIcon: WeatherIcons.day_cloudy,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Light Jacket",
          outfitTop: jacket,
          outfitBottom: jeans,
        );
      }
      break;
    case 802:
      {
        // currWeatherIcon = WeatherIcons.cloud;
        // weatherDescription = 'Scattered Clouds (25%-50%)';
        return CustomWeatherObjectWithFields(
          iconColor: cloudColor,
          weatherIcon: WeatherIcons.cloudy,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "T-Shirt",
          outfitTop: tshirt,
          outfitBottom: jeans,
        );
      }
      break;
    case 803:
      {
        // currWeatherIcon = WeatherIcons.cloudy;
        // weatherDescription = 'Broken Clouds (50%-85%)';
        return CustomWeatherObjectWithFields(
          iconColor: cloudColor,
          weatherIcon: WeatherIcons.cloudy,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Hoodie",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    case 804:
      {
        // currWeatherIcon = WeatherIcons.cloudy;
        // weatherDescription = 'Overcast Clouds (85%-100%)';
        return CustomWeatherObjectWithFields(
          iconColor: cloudColor,
          weatherIcon: WeatherIcons.cloudy,
          temperature: myTemperature,
          weatherDescription: myWeatherDescription,
          outfitTitle: "Hoodie",
          outfitTop: hoodie,
          outfitBottom: jeans,
        );
      }
      break;
    default:
      {
        // currWeatherIcon = WeatherIcons.thermometer;
        return CustomWeatherObjectWithFields(
          iconColor: Colors.yellow,
          weatherIcon: WeatherIcons.thermometer,
          temperature: myTemperature,
          weatherDescription: "You broke the weather api",
          outfitTitle: "Light Jacket",
          outfitTop: "images/png-64/hoodie-64x64-455155.png",
          outfitBottom: "images/png-64/hoodie-64x64-455155.png",
        );
      }
      break;
  }
}
