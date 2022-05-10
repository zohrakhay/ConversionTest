import 'package:conversiontest/ui/views/initial_screen.dart';
import 'package:conversiontest/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:conversiontest/ui/widgets/exchange_widget.dart';

class SettingsScreen extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SettingsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    bool animate = false;
    Future<void> initAnnimation() async {
      await Future.delayed(Duration(milliseconds: 10));
      setState(() {
        animate = true;
      });
    }

    @override
    void initState() {
      super.initState();

      initAnnimation();
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () async {
          setState(() {
            animate = false;
          });
          await Future.delayed(Duration(milliseconds: 300));
          Navigator.pop(context);
        },
        child: AnimatedContainer(
          width: deviceWidth,
          height: deviceHeight,
          duration: Duration(milliseconds: 300),
          color: animate ? Colors.black.withOpacity(0.7) : Colors.transparent,
          child: Text('Hey'),
        ),
      ),
    ));
  }
}
