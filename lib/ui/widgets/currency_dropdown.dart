import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final List<String> currencies;
  final String selectedCurrency;
  final Function(String?) onCurrencyChanged;
  final TextEditingController textEditingController = TextEditingController();

  CurrencyDropdown({
    Key? key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onCurrencyChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        items: currencies
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
            .toList(),
        value: selectedCurrency,
        onChanged: (value) => onCurrencyChanged(value),
        buttonStyleData:  const ButtonStyleData(
          height: 40,
          width: 80,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 400,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Colors.red.shade800,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 30,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
