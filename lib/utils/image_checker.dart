import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageChecker extends StatelessWidget {
  final String primaryImage;
  final String fallbackImage;

  const ImageChecker(
      {super.key, required this.primaryImage, required this.fallbackImage});

  Future<bool> _assetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _assetExists(primaryImage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data == true) {
            return Image.asset(
              primaryImage,
              width: 50,
              height: 50,
            );
          } else {
            return Image.asset(
              fallbackImage,
              width: 50,
              height: 50,
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
