import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const baseUrl = "https://v6.exchangerate-api.com/v6/";
  final apiKey = dotenv.env["apiKey"];
  static const supportedCurrencies = {
    "USD": "United States",
    "EUR": "Euro",
    "GBP": "British Pound",
    "AUD": "Australian Dollar",
    "CAD": "Canadian Dollar",
    "CHF": "Switzerland Franc",
    "AED": "United Arab Emirates Dirham",
    "BHD": "Bahraini Dinar",
    "CNY": "Chinese Yuan",
    "TRY": "Turkish Lira",
    "EGP": "Egyptian Pound",
    "KWD": "Kuwaiti Dinar",
    "JPY": "Japanese Yen",
    "QAR": "Qatari Rial",
    "THB": "Thai Baht",
    "BGN": "Bulgarian Lev",
    "CLP": "Chilean Peso",
    "CZK": "Czech Koruna",
    "DKK": "Danish Krone",
    "GEL": "Georgian Lari",
    "ALL": "Albanian Lek",
    "AFN": "Afghan Afghani",
    "AMD": "Armenian Dram",
    "AOA": "Angolan Kwanza",
    "ARS": "Argentine Peso",
    "AWG": "Aruban Florin",
    "AZN": "Azerbaijani Manat",
    "BAM": "Bosnia and Herzegovina Convertible Mark",
    "BBD": "Barbadian Dollar",
    "BDT": "Bangladeshi Taka",
    "BIF": "Burundian Franc",
    "BND": "Brunei Dollar",
    "BOB": "Bolivian Boliviano",
    "BRL": "Brazilian Real",
    "BWP": "Botswanan Pula",
    "BYN": "Belarusian Ruble",
    "CDF": "Congolese Franc",
    "COP": "Colombian Peso",
    "NOK": "Norwegian Krone",
    "PLN": "Polish Zloty",
    "SEK": "Swedish Krona",
    "CUP": "Cuban Peso",
    "DJF": "Djiboutian Franc",
    "DOP": "Dominican Peso",
    "DZD": "Algerian Dinar",
    "ERN": "Eritrean Nakfa",
    "ETB": "Ethiopian Birr",
    "GHS": "Ghanaian Cedi",
    "GIP": "Gibraltar Pound",
    "GMD": "Gambian Dalasi",
    "GNF": "Guinean Franc",
    "HKD": "Hong Kong Dollar",
    "HNL": "Honduran Lempira",
    "HRK": "Croatian Kuna",
    "HUF": "Hungarian Forint",
    "IDR": "Indonesian Rupiah",
    "INR": "Indian Rupee",
    "IQD": "Iraqi Dinar",
    "IRR": "Iranian Rial",
    "ISK": "Icelandic Króna",
    "JMD": "Jamaican Dollar",
    "JOD": "Jordanian Dinar",
    "KES": "Kenyan Shilling",
    "KGS": "Kyrgystani Som",
    "KHR": "Cambodian Riel",
    "KZT": "Kazakhstani Tenge",
    "LAK": "Laotian Kip",
    "LBP": "Lebanese Pound",
    "LKR": "Sri Lankan Rupee",
    "LRD": "Liberian Dollar",
    "MAD": "Moroccan Dirham",
    "MDL": "Moldovan Leu",
    "MUR": "Mauritian Rupee",
    "MVR": "Maldivian Rufiyaa",
    "MWK": "Malawian Kwacha",
    "MXN": "Mexican Peso",
    "MYR": "Malaysian Ringgit",
    "MZN": "Mozambican Metical",
    "NGN": "Nigerian Naira",
    "NPR": "Nepalese Rupee",
    "NZD": "New Zealand Dollar",
    "OMR": "Omani Rial",
    "PAB": "Panamanian Balboa",
    "PEN": "Peruvian Nuevo Sol",
    "PHP": "Philippine Peso",
    "PKR": "Pakistani Rupee",
    "RON": "Romanian Leu",
    "RSD": "Serbian Dinar",
    "RUB": "Russian Ruble",
    "RWF": "Rwandan Franc",
    "SAR": "Saudi Riyal",
    "SCR": "Seychellois Rupee",
    "SDG": "Sudanese Pound",
    "SGD": "Singapore Dollar",
    "SLE": "Sierra Leonean Leone",
    "SOS": "Somali Shilling",
    "TJS": "Tajikistani Somoni",
    "TMT": "Turkmenistan Manat",
    "TND": "Tunisian Dinar",
    "TWD": "New Taiwan Dollar",
    "TZS": "Tanzanian Shilling",
    "UAH": "Ukrainian Hryvnia",
    "UGX": "Ugandan Shilling",
    "UYU": "Uruguayan Peso",
    "UZS": "Uzbekistani Som",
    "VES": "Venezuelan Bolívar",
    "VND": "Vietnamese Dong",
    "YER": "Yemeni Rial",
    "ZAR": "South African Rand",
    "ZMW": "Zambian Kwacha",
    "ZWL": "Zimbabwean Dollar"
  };

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        bodyLarge: GoogleFonts.poppins().copyWith(color: Colors.white),
        titleLarge: GoogleFonts.poppins()
            .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        titleMedium: GoogleFonts.poppins().copyWith(color: Colors.black)),
    appBarTheme:
        const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
  );

  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: GoogleFonts.poppins().copyWith(color: Colors.black),
          titleLarge: GoogleFonts.poppins()
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
          titleMedium: GoogleFonts.poppins().copyWith(color: Colors.black)),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)));
}
