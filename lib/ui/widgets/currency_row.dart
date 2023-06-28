import 'package:currency_converter/ui/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

import 'currency_dropdown.dart';

class CurrencyRow extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;
  final bool isLoading;
  final TextEditingController controller;

  const CurrencyRow({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
    required this.isLoading,
    required this.controller,
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
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.end,
                    onChanged: (value) => onCurrencyChanged(value),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
    );
  }
}
