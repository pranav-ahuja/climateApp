import 'package:flutter/material.dart';
import 'package:climate_app/services/get_location.dart';
import 'package:climate_app/components/icon_used.dart';
import 'package:climate_app/services/weather_data.dart';
import 'package:climate_app/components/REUSE_CONTAINER.dart';
import 'package:climate_app/components/cards_below.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetLocation location = GetLocation();
  WeatherData weatherInfo = WeatherData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeaAndLocData();
  }

  var weatherData;
  String? country, weatherDescription;
  var city;
  double? temperature;
  int? humidity, airPressure, windSpeed;

  void getWeaAndLocData() async {
    await weatherInfo.getWeatherData();
    updateUIData(weatherInfo.getWeatherData());
  }

  void updateUIData(var weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        city = "Error";
        country = "Error";
        weatherDescription = "Error finding data";
        windSpeed = 0;
        humidity = 0;
        airPressure = 0;
      }
      city = weatherData['name'];
      country = weatherData['sys']['country'];
      temperature = weatherData['main']['temp'];
      weatherDescription = weatherData['weather'][0]['main'];
      windSpeed = weatherData['wind']['speed'];
      humidity = weatherData['main']['humidity'];
      airPressure = weatherData['main']['pressure'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconsWidgets(
              iconLogo: Icon(Icons.location_on),
              sizeOfIcon: 60,
              onPressed: () async {
                weatherData = await weatherInfo.getWeatherData();
                updateUIData(weatherData);
              },
            ),
          ],
        ),
        ReuseContainer(
          widgetUsed: Center(
            child: Text(
              "$city, $country",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ReuseContainer(
            widgetUsed: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconsWidgets(
                  iconLogo: Icon(Icons.cloud),
                  sizeOfIcon: 50,
                  colorOfIcon: Colors.black87,
                ),
                Text(
                  "$temperature°",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "$weatherDescription",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReuseContainer(
            widgetUsed: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Wind",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconsWidgets(
                      iconLogo: Icon(Icons.air_outlined),
                      sizeOfIcon: 30,
                      colorOfIcon: Colors.black87,
                    ),
                    Text(
                      "$windSpeed m/s",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ReuseContainer(
            widgetUsed: Row(
              children: [
                Expanded(
                  child: CardsBelow(
                    label: "Humidity",
                    value: humidity,
                    unit: "%",
                    iconsBelow: Icon(Icons.water_drop_outlined),
                  ),
                ),
                Expanded(
                  child: CardsBelow(
                    label: "Air Pressure",
                    value: airPressure,
                    unit: "hPa",
                    iconsBelow: Icon(Icons.air),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
