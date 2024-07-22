import 'package:curverto_flutter/viewmodels/connectivity_viewmodel.dart';
import 'package:curverto_flutter/viewmodels/home_viewmodel.dart';
import 'package:curverto_flutter/views/homeview.dart';
import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({
    super.key,
    required HomeViewModel homeViewModel,
    required this.widget,
    required ConnectivityViewModel connectivityViewModel,
  })  : _homeViewModel = homeViewModel,
        _connectivityViewModel = connectivityViewModel;

  final HomeViewModel _homeViewModel;
  final HomeView widget;
  final ConnectivityViewModel _connectivityViewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.currency_exchange,
            size: 80,
          ),
          const SizedBox(height: 10),
          Text(
            "No Data Available, please try again",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                _homeViewModel.setConversionRates(
                    widget.exchangeRate, widget.mainCurrency!);
                _connectivityViewModel.initConnectivity();
                _connectivityViewModel.initConnectivityStream();
              },
              child: Text("Try Again",
                  style: Theme.of(context).textTheme.titleMedium))
        ],
      ),
    );
  }
}
