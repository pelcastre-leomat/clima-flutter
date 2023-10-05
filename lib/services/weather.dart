import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/location.dart';


//46d7418e90fd406788780155232909
const String apiKey = "46d7418e90fd406788780155232909";
const weatherapiURL = "http://api.weatherapi.com/v1/current.json";

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation().timeout(const Duration(seconds: 5));
    NetworkHelper networkHelper = NetworkHelper(
        url: "${weatherapiURL}?key=${apiKey}&q=${location.latitude},${location.longitude}&aqi=no");

    return await networkHelper.getData();
  }

  Future<dynamic> getCityWeather(String cityName) async{
    print(cityName);
    NetworkHelper networkHelper = NetworkHelper(
        url: '${weatherapiURL}?key=${apiKey}&q=${cityName}&aqi=no');

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition == 1000) {
      return '☀️';
    }else if (condition <= 1006) {
      return '☁️';
    } else if (condition < 1063) {
      return '🌫';
    } else if (condition < 1186) {
      return '🌩';
    } else if (condition < 1192) {
      return '🌧';
    } else if (condition < 1198) {
      return '☔️';
    } else if (condition < 1137) {
      return '☃️';
    }else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
