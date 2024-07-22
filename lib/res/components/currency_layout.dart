import 'package:curverto_flutter/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyLayout extends StatelessWidget {
  final Currency currency;
  const CurrencyLayout({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(
              currency.currencyImagePath ??
                  "assets/images/default_currency.png",
              width: 50,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                currency.name!,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
