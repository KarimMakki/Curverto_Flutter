import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitRing(
      color: Colors.black,
      size: 30,
      lineWidth: 4,
    );
  }
}
