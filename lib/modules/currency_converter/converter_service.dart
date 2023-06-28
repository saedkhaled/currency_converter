import 'dart:convert';

import 'package:currency_converter/main.dart';

import 'converter_provider.dart';

/// A service for the currency converter module that handles the business logic
/// and communicates with the API provider
class ConverterService {
  /// A singleton instance of the service
  static ConverterService get to => getIt<ConverterService>();

  /// The API provider to make the API calls
  late ConverterProvider provider;

  /// A constructor to inject the [api] provider for testing
  /// or use the default provider
  ConverterService({ConverterProvider? api}) {
    provider = api ?? ConverterProvider();
  }

  /// Get the list of supported currency codes from the API
  Future<List<String>> getCodes() async {
    final response = await provider.getCodes();
    final data = jsonDecode(response.body);
    final codes = data['supported_codes']
        .map<String>((item) => item[0].toString())
        .toList();
    return codes;
  }

  /// Get the exchange rates for a currency against all other currencies
  Future<Map<String, double>> getRates(String from) async {
    final response = await provider.getRate(from);
    final data = jsonDecode(response.body);
    final rates = data['conversion_rates'].map<String, double>((key, value) =>
        MapEntry(key.toString(), double.parse(value.toString())));
    return rates;
  }
}
