import 'package:currency_converter/dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class currencyservice {
  Future<String> doconversion(fromcurrency, toCurrency) async {
    String uri = 'https://api.exchangerate-api.com/v4/latest/$fromcurrency';
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      Map jsonData = json.decode(response.body);
      String result = jsonData['rates'][toCurrency].toString();
      return result;
    } else {
      throw Exception("Error loading request URL info");
    }
  }

  getcurrencystring(String fromcurrency, String toCurrency, num amount, context,
      String type, value) {
    if (type == '1') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => dashboard(
            currencyVal: (amount / double.parse(value)).roundToDouble(),
            ConverterCurrency: amount,
            currencyone: fromcurrency,
            currencytwo: toCurrency,
            isWhite: true,
          ),
        ),
      );
    }
    if (type == '2') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => dashboard(
            currencyVal: amount,
            ConverterCurrency: (amount * double.parse(value)).roundToDouble(),
            currencyone: fromcurrency,
            currencytwo: toCurrency,
            isWhite: false,
          ),
        ),
      );
    }
  }

  convertCurrency(String fromcurrency, String toCurrency, num amount, context,
      String type) {
    doconversion(fromcurrency, toCurrency).then((value) => {
          getcurrencystring(
              fromcurrency, toCurrency, amount, context, type, value)
        });
  }
}
