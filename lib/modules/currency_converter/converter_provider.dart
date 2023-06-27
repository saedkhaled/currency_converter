import 'package:currency_converter/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

// An API provider for the currency converter module
class ConverterProvider {
  String get baseUrl =>
      'https://v6.exchangerate-api.com/v6/${dotenv.env['CONVERTER_API_KEY']}';
  final client = getIt.get<Client>();

  Future<Response> getCodes() async {
    return client.get(Uri.parse('$baseUrl/codes'));
  }

  Future<Response> getPairRate(String from, String to) async {
    return client.get(Uri.parse('$baseUrl/pair/$from/$to'));
  }

  Future<Response> getRate(String from) async {
    return client.get(Uri.parse('$baseUrl/latest/$from'));
  }
}
