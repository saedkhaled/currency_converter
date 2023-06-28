// To parse this JSON data, do
//
//     final ratesResponse = ratesResponseFromJson(jsonString);
import 'dart:convert';

class RatesResponse {
  final String? result;
  final String? documentation;
  final String? termsOfUse;
  final int? timeLastUpdateUnix;
  final String? timeLastUpdateUtc;
  final int? timeNextUpdateUnix;
  final String? timeNextUpdateUtc;
  final String? baseCode;
  final Map<String, double>? conversionRates;

  RatesResponse({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.conversionRates,
  });

  factory RatesResponse.fromRawJson(String str) => RatesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatesResponse.fromJson(Map<String, dynamic> json) => RatesResponse(
    result: json["result"],
    documentation: json["documentation"],
    termsOfUse: json["terms_of_use"],
    timeLastUpdateUnix: json["time_last_update_unix"],
    timeLastUpdateUtc: json["time_last_update_utc"],
    timeNextUpdateUnix: json["time_next_update_unix"],
    timeNextUpdateUtc: json["time_next_update_utc"],
    baseCode: json["base_code"],
    conversionRates: Map.from(json["conversion_rates"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "documentation": documentation,
    "terms_of_use": termsOfUse,
    "time_last_update_unix": timeLastUpdateUnix,
    "time_last_update_utc": timeLastUpdateUtc,
    "time_next_update_unix": timeNextUpdateUnix,
    "time_next_update_utc": timeNextUpdateUtc,
    "base_code": baseCode,
    "conversion_rates": Map.from(conversionRates!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
