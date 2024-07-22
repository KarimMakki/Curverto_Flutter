import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curverto_flutter/models/exchange_rate_model.dart';
import 'package:curverto_flutter/res/components/conversion_rate_layout.dart';
import 'package:curverto_flutter/res/components/custom_loading.dart';
import 'package:curverto_flutter/res/components/main_currency_layout.dart';
import 'package:curverto_flutter/res/components/search_field.dart';
import 'package:curverto_flutter/utils/home_arguments.dart';
import 'package:curverto_flutter/utils/routes/routes_name.dart';
import 'package:curverto_flutter/viewmodels/connectivity_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/home_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/theme_viewmodel.dart';
import 'package:curverto_flutter/views/no_data_view.dart';
import 'package:curverto_flutter/views/no_internet_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  final ExchangeRate? exchangeRate;
  final String? mainCurrency;
  const HomeView(
      {super.key, required this.exchangeRate, required this.mainCurrency});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _homeViewModel = HomeViewModel();
  late final ConnectivityViewModel _connectivityViewModel =
      ConnectivityViewModel();
  final TextEditingController _searchController = TextEditingController();
  final String _hintText = "Search Currency";
  HomeArguments? homeArguments;

  @override
  void initState() {
    super.initState();
    _homeViewModel.setConversionRates(
        widget.exchangeRate, widget.mainCurrency!);
    _connectivityViewModel.initConnectivity();
    _connectivityViewModel.initConnectivityStream();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _homeViewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: homeAppbar(context, value),
            body: StreamBuilder<List<ConnectivityResult>>(
                stream: _connectivityViewModel.connectivityStream,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      const CustomLoading();
                    case ConnectionState.active:
                      if (snapshot.hasData) {
                        var isConnected = snapshot.data?.any(
                          (element) => element.name == "none",
                        );
                        if (isConnected!) {
                          return const NoInternetView();
                        } else {
                          return Column(
                            children: [
                              SearchField(
                                searchController: _searchController,
                                hintText: _hintText,
                                search: (query) => value.searchRates(query),
                              ),
                              MainCurrencyLayout(
                                getRates: (query) => value.updateRates(query),
                                mainCurrency: homeArguments != null
                                    ? homeArguments!.mainCurrency
                                    : widget.mainCurrency!,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      value.conversionRatesResults.length,
                                  itemBuilder: (context, index) {
                                    return ConversionRateLayout(
                                        conversionRate: value
                                            .conversionRatesResults[index]);
                                  },
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    case ConnectionState.none:
                      break;
                    default:
                      NoDataView(
                          homeViewModel: _homeViewModel,
                          widget: widget,
                          connectivityViewModel: _connectivityViewModel);
                  }
                  return const CustomLoading();
                }),
          );
        },
      ),
    );
  }

  AppBar homeAppbar(BuildContext context, HomeViewModel value) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    return AppBar(
      title: Text(
        "CurVerto",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: Padding(
        padding: const EdgeInsets.all(14.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesNames.chooseCurrency)
                .then((result) {
              if (result != null && result is HomeArguments) {
                setState(() {
                  homeArguments = result;
                  value.setConversionRates(
                      homeArguments!.exchangeRate, homeArguments!.mainCurrency);
                });
              }
            });
          },
          child: Image.asset(
            themeViewModel.darkTheme
                ? "assets/images/default_currency_white.png"
                : "assets/images/default_currency.png",
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Icon(themeViewModel.darkTheme
                ? Icons.nightlight_round_outlined
                : Icons.sunny),
            Switch(
                value: themeViewModel.darkTheme,
                onChanged: ((bool value) {
                  themeViewModel.toggleTheme();
                })),
          ],
        )
      ],
      centerTitle: true,
    );
  }
}
