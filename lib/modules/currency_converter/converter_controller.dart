import 'package:currency_converter/modules/currency_converter/converter_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A Controller for the currency converter module.
class ConverterController {

  /// a responsive variable to hold the currency to convert from
  var fromCurrency = 'USD'.obs;

  /// a responsive variable to hold the currency to convert to
  var toCurrency = 'EUR'.obs;

  /// a responsive variable to hold the list of supported currencies
  var supportedCurrencies = <String>['USD', 'EUR'].obs;

  /// a responsive variable to hold the conversion rates
  var conversionRates = <String, double>{}.obs;

  /// a responsive variable to hold the error message
  var message = ''.obs;

  /// a responsive variable to hold the loading state
  var isLoading = false.obs;

  TextEditingController valueController = TextEditingController(text: '1');

  TextEditingController resultController = TextEditingController(text: '1');

  /// a constructor to initialize the supported currencies and conversion rates
  ConverterController() {
    getSupportedCurrencies();
    getConversionRates();
  }

  /// gets the supported currencies from the service and updates the
  /// [supportedCurrencies] variable
  getSupportedCurrencies() async {
    isLoading.value = true;
    final response = await ConverterService.to.getCodes();
    if (response.isOk) {
      supportedCurrencies.value = response.data ?? [];
    } else {
      message.value = response.msg;
    }
    isLoading.value = false;
  }

  /// gets the conversion rates from the service and updates the
  /// [conversionRates] variable
  getConversionRates() async {
    isLoading.value = true;
    final response = await ConverterService.to.getRates(fromCurrency.value);
    if (response.isOk) {
      conversionRates.value = response.data ?? {};
      convert();
    } else {
      message.value = response.msg;
    }
    isLoading.value = false;
  }

  onFromCurrencyChanged(String? value) {
    if (value != null && value != toCurrency.value) {
      fromCurrency.value = value;
      getConversionRates();
      convert();
    }
  }

  onToCurrencyChanged(String? value) {
    if (value != null && value != toCurrency.value) {
      toCurrency.value = value;
      convert();
    }
  }

  /// converts the amount from one currency to another using the rates stored in [conversionRates] map
  /// and updates the [result] variable
  convert() {
    final rate = conversionRates.value[toCurrency.value];
    final amountDouble = double.tryParse(valueController.text);
    if (rate != null && amountDouble != null) {
      resultController.text = (amountDouble * rate).toPrecision(4).toString();
    } else {
      resultController.text = 0.0.toString();
    }
  }

  /// handles the key press events from the keyboard and updates the [amount] variable
  onKeyPressed(value) {
    if (value == '⌫') {
      if (valueController.text.isNotEmpty) {
        valueController.text = valueController.text.substring(0, valueController.text.length - 1);
      }
    } else if (value == '.') {
      if (!valueController.text.contains('.')) {
        valueController.text += value;
      }
    } else {
      valueController.text += value;
    }
    convert();
  }

  refresh() async {
    await getSupportedCurrencies();
    getConversionRates();
  }

  swapCurrencies() {
    final temp = fromCurrency.value;
    fromCurrency.value = toCurrency.value;
    toCurrency.value = temp;
    valueController.text = resultController.text;
    getConversionRates();
    convert();
  }
}
