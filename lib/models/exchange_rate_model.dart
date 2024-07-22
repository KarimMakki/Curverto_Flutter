import 'package:curverto_flutter/models/conversion_rate_model.dart';

class ExchangeRate {
  String? baseCode;
  List<ConversionRate>? conversionRates;
  String? documentation;
  String? result;
  String? termsOfUse;
  String? lastTimeUpdateUtc;
  String? nextTimeUpdateUtc;

  ExchangeRate(
      {this.baseCode,
      this.conversionRates,
      this.documentation,
      this.result,
      this.termsOfUse,
      this.lastTimeUpdateUtc,
      this.nextTimeUpdateUtc});

  factory ExchangeRate.fromJson(Map<String, dynamic> data) {
    final baseCode = data["base_code"];
    if (baseCode == null) {
      throw FormatException(
          "Invalid JSON: required 'baseCode' field of type string in $data");
    }
    final conversionRates = data["conversion_rates"] as Map<String, dynamic>?;
    if (conversionRates == null) {
      throw FormatException(
          "Invalid JSON: required 'conversionRates' field of type Map in $data");
    }
    final documentation = data["documentation"];
    if (documentation == null) {
      throw FormatException(
          "Invalid JSON: required 'documentation' field of type String in $data");
    }
    final result = data["result"];
    if (result == null) {
      throw FormatException(
          "Invalid JSON: required 'result' field of type String in $data");
    }
    final termsofUse = data["terms_of_use"];
    if (termsofUse == null) {
      throw FormatException(
          "Invalid JSON: required 'termsofUse' field of type String in $data");
    }
    final lastTimeUpdateUtc = data["time_last_update_utc"];
    if (lastTimeUpdateUtc == null) {
      throw FormatException(
          "Invalid JSON: required 'termsofUse' field of type String in $data");
    }
    final nextTimeUpdateUtc = data["time_next_update_utc"];
    if (nextTimeUpdateUtc == null) {
      throw FormatException(
          "Invalid JSON: required 'termsofUse' field of type String in $data");
    }
    return ExchangeRate(
        baseCode: baseCode,
        conversionRates: conversionRates.entries
            .map((e) => ConversionRate(
                currency: e.key,
                rate: e.value is int ? e.value.toDouble() : e.value))
            .toList(),
        documentation: documentation,
        result: result,
        termsOfUse: termsofUse,
        lastTimeUpdateUtc: lastTimeUpdateUtc,
        nextTimeUpdateUtc: nextTimeUpdateUtc);
  }
}
