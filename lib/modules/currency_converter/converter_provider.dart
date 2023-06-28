import 'package:currency_converter/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

// An API provider for the currency converter module
class ConverterProvider {
  /// The base URL for the API calls
  String get baseUrl =>
      'https://v6.exchangerate-api.com/v6/${dotenv.env['CONVERTER_API_KEY']}';

  /// The HTTP client to make the API calls
  final client = getIt.get<Client>();

  /// Get the supported currency codes from the API
  Future<Response> getCodes() async {
    return client.get(Uri.parse('$baseUrl/codes'));
  }

  /// Get the exchange rate for a currency pair
  Future<Response> getPairRate(String from, String to) async {
    return client.get(Uri.parse('$baseUrl/pair/$from/$to'));
  }

  /// Get the exchange rate for a currency against all other currencies
  Future<Response> getRate(String from) async {
    return client.get(Uri.parse('$baseUrl/latest/$from'));
  }
}
