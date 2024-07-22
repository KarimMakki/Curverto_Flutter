import 'package:curverto_flutter/models/exchange_rate_model.dart';
import 'package:curverto_flutter/repositories/exchange_rates_repo.dart';
import 'package:curverto_flutter/res/components/error_message_dialog.dart';
import 'package:flutter/material.dart';

class ExchangeRateViewModel extends ChangeNotifier {
  final ExchangeRatesRepository _exchangeRatesRepository =
      ExchangeRatesRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool isNewLoading) {
    _isLoading = isNewLoading;
    notifyListeners();
  }

  ExchangeRate? _exchangeRate;

  ExchangeRate? get exchangeRate => _exchangeRate;

  void setExchangeRate(ExchangeRate newExchangeRate) {
    _exchangeRate = newExchangeRate;
    notifyListeners();
  }

  Future<void> getExchangeRate(
      String currencyName, BuildContext context) async {
    setLoading(true);
    try {
      ExchangeRate? exchangeRate =
          await _exchangeRatesRepository.getExchangeRate(currencyName);
      setExchangeRate(exchangeRate!);
      setLoading(false);
    } catch (error) {
      setLoading(false);
      errorMessageDialog(
          "An error ocurred, please check your internet connection", context);
      print(error.toString());
    }
  }
}
