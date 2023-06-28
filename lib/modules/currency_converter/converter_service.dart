import 'dart:convert';

import 'package:currency_converter/main.dart';
import 'package:currency_converter/models/api_response.dart';
import 'package:currency_converter/models/codes_response.dart';
import 'package:currency_converter/models/rates_response.dart';
import 'package:currency_converter/utils/extensions.dart';

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
  Future<ApiResponse<List<String>>> getCodes() async {
    try {
      final response = await provider.getCodes();
      final data = jsonDecode(response.body);
      if (!response.isOk) {
        return ApiResponse.error(data['error-type'], response.statusCode);
      }
      final codesResponse = CodesResponse.fromJson(data);
      return ApiResponse.success(codesResponse.supportedCodes, 200);
    } catch (e) {
      return ApiResponse.error(
          'Error in network connection, please try again later!', 500);
    }
  }

  /// Get the exchange rates for a currency against all other currencies
  Future<ApiResponse<Map<String, double>>> getRates(String from) async {
    try {
      final response = await provider.getRate(from);
      final data = jsonDecode(response.body);
      if (!response.isOk) {
        return ApiResponse.error(data['error-type'], response.statusCode);
      }
      final ratesResponse = RatesResponse.fromJson(data);
      return ApiResponse.success(ratesResponse.conversionRates, 200);
    } catch (e) {
      return ApiResponse.error(
          'Error in network connection, please try again later!', 500);
    }
  }
}
