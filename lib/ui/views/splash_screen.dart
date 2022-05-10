import 'dart:async';
import 'package:conversiontest/ui/views/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InitialScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey, Color.fromARGB(255, 205, 201, 201)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/logo2.png"),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const Center(
                child: Text(
              'Easy Conversion',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            )),
            const Padding(padding: EdgeInsets.only(top: 40.0)),
            const SizedBox(
              height: 70,
              width: 70,
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,
                strokeWidth: 2,
                colors: [Colors.grey],
              ),
            )
          ],
        ),
      ),
    );
  }
}
