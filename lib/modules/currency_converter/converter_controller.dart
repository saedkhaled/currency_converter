import 'package:currency_converter/modules/currency_converter/converter_service.dart';
import 'package:get/get.dart';

/// A Controller for the currency converter module.
class ConverterController {
  /// a responsive variable to hold the amount to convert
  var amount = '1.0'.obs;

  /// a responsive variable to hold the currency to convert from
  var fromCurrency = 'USD'.obs;

  /// a responsive variable to hold the currency to convert to
  var toCurrency = 'EUR'.obs;

  /// a responsive variable to hold the result of the conversion
  var result = 0.0.obs;

  /// a responsive variable to hold the list of supported currencies
  var supportedCurrencies = <String>['USD', 'EUR'].obs;

  /// a responsive variable to hold the conversion rates
  var conversionRates = <String, double>{}.obs;

  /// a constructor to initialize the supported currencies and conversion rates
  ConverterController() {
    getSupportedCurrencies();
    getConversionRates();
  }

  /// gets the supported currencies from the service and updates the
  /// [supportedCurrencies] variable
  getSupportedCurrencies() async {
    final response = await ConverterService.to.getCodes();
    supportedCurrencies.value = response;
  }

  /// gets the conversion rates from the service and updates the
  /// [conversionRates] variable
  getConversionRates() async {
    final response = await ConverterService.to.getRates(fromCurrency.value);
    conversionRates.value = response;
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
    final amountDouble = double.tryParse(amount.value);
    if (rate != null && amountDouble != null) {
      result.value = (amountDouble * rate).toPrecision(4);
    } else {
      result.value = 0.0;
    }
  }

  onKeyPressed(value) {
    if (value == '⌫') {
      amount.value = amount.value.substring(0, amount.value.length - 1);
    } else if (value == '.') {
      if (!amount.value.contains('.')) {
        amount.value += value;
      }
    } else {
      amount.value += value;
    }
    convert();
  }
}
