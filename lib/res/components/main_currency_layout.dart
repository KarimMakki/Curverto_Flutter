import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainCurrencyLayout extends StatefulWidget {
  final Function(String query) getRates;
  final String mainCurrency;
  const MainCurrencyLayout(
      {super.key, required this.getRates, required this.mainCurrency});

  @override
  State<MainCurrencyLayout> createState() => _MainCurrencyLayoutState();
}

class _MainCurrencyLayoutState extends State<MainCurrencyLayout> {
  final TextEditingController _controller = TextEditingController(text: "1.0");

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
              "assets/images/${widget.mainCurrency.toLowerCase()}.png",
              width: 50,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.mainCurrency,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  controller: _controller,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                  ],
                  onChanged: (value) => widget.getRates(value),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 22),
                ))
          ],
        ),
      ),
    );
  }
}
