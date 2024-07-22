import 'package:curverto_flutter/utils/home_arguments.dart';
import 'package:curverto_flutter/utils/routes/routes_name.dart';
import 'package:curverto_flutter/views/choose_currency_view.dart';
import 'package:curverto_flutter/views/homeview.dart';
import 'package:curverto_flutter/views/splash_screen_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesNames.home:
        final args = settings.arguments as HomeArguments;
        return MaterialPageRoute(
          builder: (context) => HomeView(
            exchangeRate: args.exchangeRate,
            mainCurrency: args.mainCurrency,
          ),
        );
      case RoutesNames.chooseCurrency:
        return MaterialPageRoute(
          builder: (context) => const ChooseCurrencyView(),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const ChooseCurrencyView());
    }
  }
}
