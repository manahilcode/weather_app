

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_api/weather.dart';
import 'package:http/http.dart'as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherService weatherService =WeatherService();
  // Weather weather=Weather();
  WeatherMain weatherMain = WeatherMain();
  bool isLoading=true;
  @override
  void  initState(){

    super.initState();
    // setState(() {
    //   isLoading=true;
    //);



    getWeather();
    // setState(() {
    //   isLoading=false;
   // );

  }

  void getWeather()async{
    print("before get");
    setState(() {
      isLoading=true;
    });
    weatherMain=await  weatherService.getCurrentWeather("London");
    // print(weather.);
    setState(() {
      isLoading=false;
    });
    print(weatherMain.base);
    // print(weather.temp_f);
    // print(weather.condition);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading?
            SizedBox(

            ):
            ListTile(
              title: Text("Visibilty",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 15,
              ),
              ),
              trailing: Text(weatherMain.visibility!.toString()),
            ),
        ListTile(
          title: Text("Cordinate",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 15,
          ),
          ),
          trailing: Text(weatherMain.coord!.toString()),
        ),
        ListTile(
          title: Text("Weather",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 15,
          ),
          ),
          trailing:   Text(weatherMain.weather!.toString()),
        ),
        ListTile(
          title: Text("Clouds",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 15,
          ),
          ),
          trailing: Text(weatherMain.clouds!.toString()),
        ),
        ListTile(
          title: Text("Details",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 15,
          ),
          ),
          trailing:Text(weatherMain.main!.toString()),
        ),
        ListTile(
          title: Text("Region",style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 15,
          ),
          ),
          trailing: Text(weatherMain.sys!.toString()),
        ),

        // Text(weatherMain.visibility!.toString()),
        //  Text(weatherMain.coord!.toString()),
        //  Text(weatherMain.clouds!.toString()),
        //
        //  Text(weatherMain.main!.toString()),
        //
        //  Text(weatherMain.weather!.toString()),
        // Text(weatherMain.sys!.toString()),

      ],
    );
  }
}



class WeatherService{
  Future getCurrentWeather(String place) async{
    // final queryParameters={
    //
    //   'key':'fd9de2bd30c244cbada184624231307',
    //   'q':place,
    // };

   // String apikey="YOUR API KEY";
    http://api.weatherapi.com/v1/current.jason
    final uri=Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=islamabad&appid=973017746946aa883011692d2d76d2e8');

    final response =await http.get(uri);
    if(response.statusCode==200) {
      return WeatherMain.fromJson(jsonDecode(response.body));
    }
    else{
      //TODO:Throw error here
    }
    // return Weather;
  }
}
