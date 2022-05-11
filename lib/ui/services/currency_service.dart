import 'dart:convert';
import 'package:conversiontest/ui/models/currency.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  static Future<List<Currency>> getCurrencies() async {
    Uri myUri = Uri.parse('https://api.fastforex.io/currencies?api_key=e054e030ce-10a758466b-rbo4po');

    dynamic res = await http.get(myUri);
    // print(res);

    if (res.statusCode == 200) {
      var decodedResponse = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
     // print(decodedResponse);
      List<Currency> currencies = [];
      for (var item in decodedResponse['currencies'].keys) {
        currencies.add(Currency(code: item, name: decodedResponse['currencies'][item]));
      }
    //  print(currencies);
      return currencies;
    } else {
      print("can't get currenries");
      return [];
    }
  }
}
