import 'package:curverto_flutter/constants.dart';
import 'package:curverto_flutter/models/currency_model.dart';
import 'package:curverto_flutter/utils/shared_preferences_service.dart';
import 'package:curverto_flutter/viewmodels/exchange_rate_viewmodel.dart';
import 'package:flutter/material.dart';

class ChooseCurrencyViewModel extends ChangeNotifier {
  List<Currency>? _currencies;
  List<Currency>? get currencies => _currencies;

  List<Currency>? _currenciesResult;
  List<Currency>? get currenciesResult => _currenciesResult;

  Map<String, String> supportedCurrencies = Constants.supportedCurrencies;

  String? _mainCurrency;

  String? get mainCurrency => _mainCurrency;

  final ExchangeRateViewModel _exchangeRateViewModel = ExchangeRateViewModel();

  ExchangeRateViewModel get exchangeRateViewModel => _exchangeRateViewModel;

  Future<void> getExchangeRate(BuildContext context) async {
    if (_mainCurrency != null) {
      await _exchangeRateViewModel.getExchangeRate(_mainCurrency!, context);
    }
  }

  Future setMainCurrency(String mainCurrency) async {
    await SharedPreferencesService.setMainCurrency(mainCurrency);
    _mainCurrency = mainCurrency;
    notifyListeners();
  }

  void getCurrencies() {
    _currencies = supportedCurrencies.entries
        .map((element) => Currency(
            name: element.key,
            country: element.value,
            currencyImagePath:
                "assets/images/${element.key.toLowerCase()}.png"))
        .toList();
    _currenciesResult = _currencies;
  }

  void searchCurrencies(String query) {
    if (query.isNotEmpty) {
      _currenciesResult = _currencies!
          .where((element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()) ||
              element.country!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _currenciesResult = List.from(_currencies!);
    }
    notifyListeners();
  }
}
