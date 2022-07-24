import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print('this line of code is triggered');
    getData();
  }

  void getLocation() async {
    Location location = Location();
   await location.getCurrentLocation();
   print(location.latitude);
   print(location.longitude);
   getData();
  }
  void getData() async {
    http.Response  response=  await http.get(Uri.parse('https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=e9d7c7fc43642d267e38930f4f3545df'));
       print(response.body);
        }

        @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();

  }
}
