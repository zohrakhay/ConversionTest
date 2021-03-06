import 'package:conversiontest/core/providers/currency_provider.dart';
import 'package:conversiontest/core/services/currency_service.dart';
import 'package:conversiontest/ui/views/main_screen.dart';
import 'package:conversiontest/ui/widgets/exchange_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final TextEditingController _fromValueController = TextEditingController();
  final TextEditingController _toValueController = TextEditingController();
  CurrencyService currencyService = CurrencyService();
  _getCurrencies() async {
    var provider = Provider.of<CurrencyProvider>(context, listen: false);
    var response = await CurrencyService.getCurrencies();
    // print('AAAAAAAAAAAAA');
    // print(response);
    provider.setCurrenciessList(response);
    // print("*********");
    // print(provider.currenciessList);
  }

  @override
  void initState() {
    super.initState();
    _getCurrencies();
  }

  String dropdownValue = 'TND';
  String dropdownValue1 = 'USD';
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.08),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/logo2.png',
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.2,
            ),
            Padding(
                padding: EdgeInsets.all(deviceHeight * 0.1),
                child: const Align(
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 205, 201, 201), width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color.fromARGB(255, 205, 201, 201),
                        filled: true,
                        hintText: 'userName',
                      ),
                    ))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
              child: Padding(
                padding: EdgeInsets.only(top: deviceHeight * 0.3),
                child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                            height: deviceWidth * 0.1,
                            width: deviceWidth * 0.2,
                            child: Consumer<CurrencyProvider>(builder: (_, provider, __) {
                              return DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  size: 15,
                                ),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: provider.currenciessList.map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value.code,
                                    child: Text(value.code),
                                  );
                                }).toList(),
                              );
                            })),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: deviceWidth * 0.4,
                            child: Image.asset(
                              'assets/exchange.png',
                              width: deviceWidth * 0.5,
                              height: deviceWidth * 0.5,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: deviceWidth * 0.1,
                            width: deviceWidth * 0.2,
                            child: Consumer<CurrencyProvider>(builder: (_, provider, __) {
                              return DropdownButton<String>(
                                value: dropdownValue1,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  size: 15,
                                ),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue1 = newValue!;
                                  });
                                },
                                items: provider.currenciessList.map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value.code,
                                    child: Text(value.code),
                                  );
                                }).toList(),
                              );
                            })),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: deviceHeight * 0.08),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: deviceWidth * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 205, 201, 201)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
