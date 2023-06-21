import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:weatherly/models/weather.dart';

class WeatherController extends GetxController {
  var button = 'Get weather'.obs;

  var weatherData = Weather(windSpeed: 123, pressure: 123, humidity: 123, temperature: 123, long: 5.760269, lat: 5.544230).obs;
  
  void getWeather(location) async {
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=845f351a35bf5fc99a1980396bd32c5c';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      Weather weather = Weather(
        windSpeed: responseData['wind']['speed'],
        pressure: responseData['main']['pressure'],
        humidity: responseData['main']['humidity'],
        temperature: responseData['main']['temp'],
        long: responseData['coord']['lon'],
        lat: responseData['coord']['lat']
      );

      weatherData.value = weather;
      update();
    }
    
  }
}