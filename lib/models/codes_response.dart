import 'dart:convert';

class CodesResponse {
  final String? result;
  final String? documentation;
  final String? termsOfUse;
  final List<String> supportedCodes;

  CodesResponse({
    this.result,
    this.documentation,
    this.termsOfUse,
    required this.supportedCodes,
  });

  factory CodesResponse.fromRawJson(String str) =>
      CodesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CodesResponse.fromJson(Map<String, dynamic> json) => CodesResponse(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        supportedCodes: json["supported_codes"] == null
            ? []
            : json['supported_codes']
                .map<String>((item) => item[0].toString())
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "documentation": documentation,
        "terms_of_use": termsOfUse,
        "supported_codes": supportedCodes,
      };
}
