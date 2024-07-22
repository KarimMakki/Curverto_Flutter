import 'package:curverto_flutter/models/exchange_rate_model.dart';

class HomeArguments {
  final ExchangeRate exchangeRate;
  final String mainCurrency;

  HomeArguments({required this.exchangeRate, required this.mainCurrency});
}
