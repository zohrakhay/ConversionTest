import 'package:conversiontest/ui/views/archive_screen.dart';
import 'package:conversiontest/ui/views/initial_screen.dart';
import 'package:conversiontest/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:conversiontest/ui/widgets/exchange_widget.dart';

class MainScreen extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    const IconData settings = IconData(0xe57f, fontFamily: 'MaterialIcons');
    const IconData sd_storage = IconData(0xe566, fontFamily: 'MaterialIcons');
    const IconData delete = IconData(0xe1b9, fontFamily: 'MaterialIcons');

    return Scaffold(
        appBar: AppBarWidget(deviceHeight: deviceHeight, deviceWidth: deviceWidth, context: context),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
              child: Align(
                alignment: Alignment.topCenter,
                child: exchangeContainer(deviceHeight: deviceHeight, deviceWidth: deviceWidth),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: deviceHeight * 0.22, left: deviceHeight * 0.05, right: deviceHeight * 0.05),
                child: const Align(
                    alignment: Alignment.topCenter,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 205, 201, 201), width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                        fillColor: Color.fromARGB(255, 205, 201, 201),
                        filled: true,
                        hintText: 'Input Amount',
                      ),
                    ))),
            Padding(
                padding:
                    EdgeInsets.only(top: deviceHeight * 0.32, left: deviceHeight * 0.05, right: deviceHeight * 0.05),
                child: const Align(
                    alignment: Alignment.topCenter,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 205, 201, 201), width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                        fillColor: Color.fromARGB(255, 205, 201, 201),
                        filled: true,
                        hintText: 'Output Amount',
                      ),
                    ))),
            Padding(
              padding: EdgeInsets.only(bottom: deviceHeight * 0.11),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: deviceWidth * 0.6,
                  height: deviceWidth * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 96, 152, 98)),
                    onPressed: () {},
                    child: const Icon(
                      sd_storage,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: deviceHeight * 0.05),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: deviceWidth * 0.6,
                  height: deviceWidth * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 211, 83, 74)),
                    onPressed: () {},
                    child: const Icon(
                      delete,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
