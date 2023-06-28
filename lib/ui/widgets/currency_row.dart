import 'package:currency_converter/ui/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

import 'currency_dropdown.dart';

class CurrencyRow extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;
  final String amount;
  final bool isLoading;

  const CurrencyRow({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
    required this.amount,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: isLoading
          ? Container(
              width: double.infinity,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
            )
          : Row(
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
            ),
    );
  }
}
