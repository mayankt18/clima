import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '85e174525cc2926166fafa3d1d78ab85';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking =
        Networking('$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');

    var cityWeather = await networking.getData();
    return cityWeather;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    Networking networking = Networking(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var data = await networking.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧥 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
