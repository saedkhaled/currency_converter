import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;

  const CurrencyDropdown({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 30,
        color: Colors.white,
      ),
      dropdownColor: Colors.red,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),

      items: currencies.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Row(
            children: [Text(dropDownStringItem)],
          ),
        );
      }).toList(),
      onChanged: (value) => onCurrencyChanged(value),
      value: selectedCurrency,
    );
  }
}
