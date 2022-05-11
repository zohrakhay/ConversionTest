import 'package:conversiontest/ui/models/currency.dart';
import 'package:flutter/foundation.dart';

class CurrencyProvider extends ChangeNotifier {
  List<Currency> _currenciesList = [];
  List<Currency> get currenciessList => _currenciesList;
  setCurrenciessList(List<Currency> currenciesList) {
    _currenciesList = currenciesList;
    notifyListeners();
  }
}
