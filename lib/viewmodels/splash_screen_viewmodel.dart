import 'package:curverto_flutter/utils/home_arguments.dart';
import 'package:curverto_flutter/utils/routes/routes_name.dart';
import 'package:curverto_flutter/utils/shared_preferences_service.dart';
import 'package:curverto_flutter/viewmodels/exchange_rate_viewmodel.dart';
import 'package:flutter/material.dart';

class SplashScreenViewModel extends ChangeNotifier {
  final ExchangeRateViewModel _exchangeRateViewModel = ExchangeRateViewModel();

  String? _mainCurrency;

  String? get mainCurrency => _mainCurrency;

  Future loadMainCurrency() async {
    _mainCurrency = SharedPreferencesService.getMainCurrency();
    notifyListeners();
  }

  Future<void> navigateToHome(BuildContext context) async {
    await loadMainCurrency();
    if (_mainCurrency != null) {
      await _exchangeRateViewModel.getExchangeRate(_mainCurrency!, context);
      if (_exchangeRateViewModel.exchangeRate != null &&
          _exchangeRateViewModel.isLoading == false) {
        if (context.mounted) {
          await Navigator.pushNamedAndRemoveUntil(
              context, RoutesNames.home, (Route<dynamic> route) => false,
              arguments: HomeArguments(
                  exchangeRate: _exchangeRateViewModel.exchangeRate!,
                  mainCurrency: _mainCurrency!));
        }
      }
    } else {
      if (context.mounted) {
        await Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNames.chooseCurrency,
          (Route<dynamic> route) => false,
        );
      }
    }
  }
}
