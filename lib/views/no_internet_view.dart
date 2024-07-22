import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off_rounded,
            size: 80,
          ),
          Text(
            "No Internet Connection, please check again!",
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
