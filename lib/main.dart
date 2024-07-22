import 'package:curverto_flutter/constants.dart';
import 'package:curverto_flutter/utils/routes/routes.dart';
import 'package:curverto_flutter/utils/routes/routes_name.dart';
import 'package:curverto_flutter/utils/shared_preferences_service.dart';
import 'package:curverto_flutter/viewmodels/choose_currency_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/connectivity_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/exchange_rate_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/home_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/splash_screen_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  await dotenv.load();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late ThemeViewModel _themeViewModel;
  @override
  void initState() {
    super.initState();
    _themeViewModel = ThemeViewModel();
    _themeViewModel.initializeTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ChangeNotifierProvider(create: (context) => ExchangeRateViewModel()),
          ChangeNotifierProvider(
              create: (context) => ChooseCurrencyViewModel()),
          ChangeNotifierProvider(create: (context) => SplashScreenViewModel()),
          ChangeNotifierProvider(create: (context) => _themeViewModel),
          ChangeNotifierProvider(create: (context) => ConnectivityViewModel())
        ],
        child: Consumer<ThemeViewModel>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Curverto',
              theme: value.darkTheme
                  ? Constants().darkTheme
                  : Constants().lightTheme,
              initialRoute: RoutesNames.splashScreen,
              onGenerateRoute: Routes.generateRoute,
            );
          },
        ));
  }
}
