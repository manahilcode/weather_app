import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:weather_api/currentweather.dart';
import 'package:weather_api/weather.dart';
void main()=>runApp(
    MaterialApp(
      home:api(),
      debugShowCheckedModeBanner: false,
    )

);
class api extends StatefulWidget {
  const api({Key? key}) : super(key: key);

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.cyan,
        title:Text('weather app',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize:30,),),
      ),
      body: Column(

        children: [
          SizedBox(
            height: 60,

          ),

          Center(child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8qvDDLP6p7ldfmrPC1N-Aqf2lshBv5dBLtw&usqp=CAU'))),
          SizedBox(height: 60,),
          MainScreen(),

          // Container(
          //
          //   color: Colors.cyan,
          //   height: 280,
          //   width: 330,
          //   child:MainScreen(),
          // ),
        ],
      ),




    );
  }
}

