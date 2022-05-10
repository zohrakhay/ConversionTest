import 'package:conversiontest/ui/views/archive_screen.dart';
import 'package:conversiontest/ui/views/main_screen.dart';
import 'package:conversiontest/ui/views/settings_screen.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget AppBarWidget({required deviceHeight, required deviceWidth, required BuildContext context}) {
  const IconData settings = IconData(0xe57f, fontFamily: 'MaterialIcons');

  return PreferredSize(
      preferredSize: Size(deviceWidth, deviceHeight * 0.08),
      child: Padding(
        padding: EdgeInsets.only(top: deviceHeight * 0.05),
        child: Container(
          // color: Colors.red,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: deviceWidth * 0.01),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                    },
                    child: Container(
                      //width: deviceWidth * 0.35,
                      //height: deviceWidth * 0.35,
                      child: Image.asset(
                        'assets/logo2.png',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: deviceWidth * 0.15, top: deviceWidth * 0.01),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArchiveScreen()));
                    },
                    child: Container(
                      child: Image.asset(
                        'assets/saved2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // child: Icon(
                  //   sd_storage,
                  //   size: 35,
                  //   color: Colors.black,
                  // ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: deviceWidth * 0.05, top: deviceWidth * 0.01),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, animation, secondaryAnimation) => SettingsScreen(),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: Icon(
                      settings,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ));
}
