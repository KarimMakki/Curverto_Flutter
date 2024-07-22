import 'package:curverto_flutter/models/currency_model.dart';
import 'package:curverto_flutter/res/components/currency_layout.dart';
import 'package:curverto_flutter/res/components/error_message_dialog.dart';
import 'package:curverto_flutter/res/components/search_field.dart';
import 'package:curverto_flutter/utils/home_arguments.dart';
import 'package:curverto_flutter/utils/routes/routes_name.dart';
import 'package:curverto_flutter/viewmodels/choose_currency_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseCurrencyView extends StatefulWidget {
  const ChooseCurrencyView({super.key});

  @override
  State<ChooseCurrencyView> createState() => _ChooseCurrencyViewState();
}

class _ChooseCurrencyViewState extends State<ChooseCurrencyView> {
  final ChooseCurrencyViewModel _chooseCurrencyViewModel =
      ChooseCurrencyViewModel();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _chooseCurrencyViewModel.getCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: ChangeNotifierProvider(
            create: (context) => _chooseCurrencyViewModel,
            child: Consumer<ChooseCurrencyViewModel>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Text(
                        "Choose Currency",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 28, fontWeight: FontWeight.w800),
                      ),
                    ),
                    SearchField(
                        searchController: _searchController,
                        hintText: "Search Currency...",
                        search: (query) => value.searchCurrencies(query)),
                    Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.currenciesResult!.length,
                      itemBuilder: (context, index) {
                        Currency currency = value.currenciesResult![index];
                        return GestureDetector(
                            onTap: () async {
                              // showDialog(
                              //   context: context,
                              //   builder: (context) => const Center(
                              //       child: CircularProgressIndicator()),
                              // );
                              await value.setMainCurrency(currency.name!);
                              await value.getExchangeRate(context);
                              if (value.exchangeRateViewModel.exchangeRate !=
                                  null) {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.pop(
                                      context,
                                      HomeArguments(
                                          exchangeRate: value
                                              .exchangeRateViewModel
                                              .exchangeRate!,
                                          mainCurrency: currency.name!));
                                } else {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      RoutesNames.home,
                                      (Route<dynamic> route) => false,
                                      arguments: HomeArguments(
                                          exchangeRate: value
                                              .exchangeRateViewModel
                                              .exchangeRate!,
                                          mainCurrency: currency.name!));
                                }
                              } else {
                                errorMessageDialog(
                                    "Couldn't fetch the exchange rate, please try again",
                                    context);
                              }
                            },
                            child: CurrencyLayout(currency: currency));
                      },
                    ))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
