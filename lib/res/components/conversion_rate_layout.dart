import 'package:curverto_flutter/models/conversion_rate_model.dart';
import 'package:curverto_flutter/utils/image_checker.dart';
import 'package:flutter/material.dart';

class ConversionRateLayout extends StatelessWidget {
  const ConversionRateLayout({super.key, required this.conversionRate});

  final ConversionRate conversionRate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Row(
          children: [
            ImageChecker(
                primaryImage:
                    "assets/images/${conversionRate.currency?.toLowerCase()}.png",
                fallbackImage: "assets/images/default_currency.png"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                conversionRate.currency!,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Text(
              conversionRate.rate!.toStringAsFixed(2),
              style: const TextStyle(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
