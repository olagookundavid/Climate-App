// ignore_for_file: deprecated_member_use, avoid_print, unused_local_variable

import 'package:climate_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'c51d76b2cfe874533cb46b51deec4f71';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? long;
  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async {
    Location location = Location();
    await location.getuserLocation();
    lat = location.latitude;
    long = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
    var weatherdata = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){return const LocationScreen();}));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white,size: 100,)
      ),
    );
  }
}



// var temp = jsonDecode(data)['main']['temp'];
      // var condition = jsonDecode(data)['weather'][0]['id'];
      // var cityName = jsonDecode(data)['name'];