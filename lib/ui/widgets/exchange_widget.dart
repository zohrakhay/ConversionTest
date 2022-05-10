import 'package:flutter/material.dart';

Widget exchangeContainer({required deviceHeight, required deviceWidth}) {
  return Row(
    children: [
      SizedBox(
        height: deviceWidth * 0.1,
        width: deviceWidth * 0.2,
        child: const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 205, 201, 201), width: 2.0),
            ),
            border: OutlineInputBorder(),
            fillColor: Color.fromARGB(255, 205, 201, 201),
            filled: true,
            hintText: 'From',
          ),
        ),
      ),
      Container(
        width: deviceWidth * 0.4,
        child: Image.asset(
          'assets/exchange.png',
          width: deviceWidth * 0.5,
          height: deviceWidth * 0.5,
        ),
      ),
      SizedBox(
        height: deviceWidth * 0.1,
        width: deviceWidth * 0.2,
        child: const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 205, 201, 201), width: 2.0),
            ),
            border: OutlineInputBorder(),
            fillColor: Color.fromARGB(255, 205, 201, 201),
            filled: true,
            hintText: 'To',
          ),
        ),
      ),
    ],
  );
}
