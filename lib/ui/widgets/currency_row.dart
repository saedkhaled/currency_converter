import 'package:currency_converter/ui/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

import 'currency_dropdown.dart';

class CurrencyRow extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;
  final Function(String) onAmountChanged;
  final bool isLoading;
  final TextEditingController controller;
  final bool isFieldDisabled;

  const CurrencyRow({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
    required this.isLoading,
    required this.controller,
    this.isFieldDisabled = false,
    required this.onAmountChanged,
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
                    onChanged: onAmountChanged,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800,
                    ),
                    readOnly: isFieldDisabled,
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade800,
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
