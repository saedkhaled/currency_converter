import 'dart:convert';
import 'package:currency_converter/main.dart';
import 'converter_provider.dart';

class ConverterService {
  static ConverterService get to => getIt<ConverterService>();

  late ConverterProvider provider;

  ConverterService({ConverterProvider? api}) {
    provider = api ?? ConverterProvider();
  }

  Future<double> convert(double amount, String from, String to) async {
    final response = await provider.getPairRate(from, to);
    final data = jsonDecode(response.body);
    final rate = double.parse(data['conversion_rate']);
    return amount * rate;
  }

  Future<List<String>> getCodes() async {
    final response = await provider.getCodes();
    final data = jsonDecode(response.body);
    final codes = data['supported_codes'];
    return codes;
  }

  Future<Map> getRate(String from) async {
    final response = await provider.getRate(from);
    final data = jsonDecode(response.body);
    return data['conversion_rates'];
  }
}
