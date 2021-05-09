import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //double lattitude;
  // double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // WeatherModel weatherModel = WeatherModel();
    // var weatherData = WeatherModel().getLocationWeather();
    dynamic weatherData;
    try {
      weatherData = await Future.value(WeatherModel().getLocationWeather())
          .timeout(const Duration(seconds: 5));
    } catch (e) {
      print('Failed to get data by $e');
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationWeather: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );

    // String myMargin = 'abc';
    // double myMarginAsdouble;
    //
    // try {
    //   myMarginAsdouble = double.parse(myMargin);
    // } catch (e) {
    //   print(e);
    //   //myMarginAsdouble = 30.0;
    // }
    // return Scaffold(
    //   body: Container(
    //     margin: EdgeInsets.all(myMarginAsdouble ?? 30.0),
    //     color: Colors.red,
    //   ),
    // );
  }
}
