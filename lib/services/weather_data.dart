import 'package:http/http.dart' as http;
import 'package:climate_app/services/get_location.dart';
import 'dart:convert';

const String kApiKey = "6552fe157cc9dfdad169d7708cfe7b80";

class WeatherData {
  GetLocation loc = GetLocation();

  Future<dynamic> getWeatherData() async {
    await loc.getLocation();

    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${loc.Latitude}&lon=${loc.Longitude}&appid=${kApiKey}&units=metric"));

    var data = response.body;
    var weatherData = jsonDecode(data);
    return weatherData;
  }

  Future<dynamic> getCityData(var cityName) async {
    print("in getCityData");
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${kApiKey}&unit=metric"));
    var data = response.body;
    var weatherData = jsonDecode(data);
    return weatherData;
  }
}
