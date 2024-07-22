import 'package:curverto_flutter/constants.dart';
import 'package:curverto_flutter/models/conversion_rate_model.dart';
import 'package:curverto_flutter/models/exchange_rate_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<ConversionRate>? _conversionRates;
  List<ConversionRate>? get conversionRates => _conversionRates;

  List<ConversionRate> _multipliedConversionRates = [];
  List<ConversionRate> get multipliedConversionRates =>
      _multipliedConversionRates;

  List<ConversionRate> _conversionRatesResults = [];
  List<ConversionRate> get conversionRatesResults => _conversionRatesResults;

  String _currentSearchQuery = '';

  void setConversionRates(ExchangeRate? exchangeRate, String mainCurrency) {
    if (exchangeRate?.conversionRates != null) {
      _conversionRates = exchangeRate?.conversionRates!
          .where((conversionRate) => Constants.supportedCurrencies
              .containsKey(conversionRate.currency))
          .toList();
      // remove the main currency from the list
      _conversionRates!
          .removeWhere((element) => element.currency == mainCurrency);
      _multipliedConversionRates = _conversionRates!;
      _applySearchQuery();
    }
  }

  void searchRates(String query) {
    _currentSearchQuery = query;
    _applySearchQuery();
  }

  void updateRates(String value) {
    if (value.isNotEmpty) {
      double multiplier = double.tryParse(value) ?? 1.0;
      _multipliedConversionRates = _conversionRates!.map((element) {
        return ConversionRate(
          currency: element.currency,
          rate: element.rate! * multiplier,
        );
      }).toList();
    } else {
      _multipliedConversionRates = List.from(_conversionRates!);
    }
    _applySearchQuery();
  }

  void _applySearchQuery() {
    if (_currentSearchQuery.isNotEmpty) {
      _conversionRatesResults = _multipliedConversionRates
          .where((element) => element.currency!
              .toLowerCase()
              .contains(_currentSearchQuery.toLowerCase()))
          .toList();
    } else {
      _conversionRatesResults = List.from(_multipliedConversionRates);
    }
    notifyListeners();
  }
}
