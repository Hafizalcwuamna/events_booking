import 'dart:async';

import 'package:events_booking/screen/images.dart';
import 'package:events_booking/screen/login.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Test())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                //     // color: Color(006EB9),
                color: Colors.white),

            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("images/bg.PNG"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Expanded(
                flex: 2,
                child: Container(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    height: 250.0,
                    width: 250.0,
                    child: Image.asset(
                      Images.logo,
                      height: 250.0,
                      width: 250.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    // Center(
                    //     child:Text(
                    //
                    //       'D2D CARGO\nSERVICES',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 16.0,
                    //
                    //       ),
                    //
                    //     ),
                    //     // SizedBox(
                    //     //   height: 10.0,
                    //     // )
                    // ),
                    Text(
                      'Events\nBooking',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(132, 22, 23, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
