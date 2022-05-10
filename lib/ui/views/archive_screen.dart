import 'package:conversiontest/ui/views/initial_screen.dart';
import 'package:conversiontest/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:conversiontest/ui/widgets/exchange_widget.dart';

class ArchiveScreen extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ArchiveScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBarWidget(deviceHeight: deviceHeight, deviceWidth: deviceWidth, context: context),
        body: Padding(
          padding: EdgeInsets.only(top: deviceHeight * 0.05),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: deviceHeight * 0.05, bottom: deviceHeight * 0.05),
                child: Row(
                  children: [
                    Container(
                      height: deviceWidth * 0.15,
                      width: deviceWidth * 0.85,
                      child: const Center(child: Text('Output Amount')),
                      color: Color.fromARGB(255, 205, 201, 201),
                    )
                  ],
                ),
              );
            },
            itemCount: 2,
          ),
        ));
  }
}
