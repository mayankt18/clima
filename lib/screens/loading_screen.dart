import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var data = await WeatherModel().getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(data);
    }));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
      ),
    );
  }
}
