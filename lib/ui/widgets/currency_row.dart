import 'package:flutter/material.dart';

import 'currency_dropdown.dart';

class CurrencyRow extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;
  final String amount;

  const CurrencyRow({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurrencyDropdown(
          currencies: currencies,
          selectedCurrency: selectedCurrency,
          onCurrencyChanged: onCurrencyChanged,
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
