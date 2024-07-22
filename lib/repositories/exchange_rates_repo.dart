import 'package:curverto_flutter/constants.dart';
import 'package:curverto_flutter/models/exchange_rate_model.dart';
import 'package:dio/dio.dart';

class ExchangeRatesRepository {
  Future<dynamic> getExchangeRate(String currencyName) async {
    final apiKey = Constants().apiKey;
    const baseUrl = Constants.baseUrl;
    final dio = Dio();
    final response = await dio.get("$baseUrl/$apiKey/latest/$currencyName");
    if (response.statusCode == 200) {
      final exchangeRate = ExchangeRate.fromJson(response.data);
      return exchangeRate;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
