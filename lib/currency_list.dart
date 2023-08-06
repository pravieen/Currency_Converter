// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:currency_converter/currencyservice.dart';
import 'package:currency_converter/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class currency_list extends StatefulWidget {
  const currency_list(
      {super.key, this.currencyNum, this.currencyOne, this.currencyTwo});

  final currencyNum;
  final currencyOne;
  final currencyTwo;
  @override
  State<currency_list> createState() => _currency_listState();
}

class _currency_listState extends State<currency_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          getListItem('INR'),
          getListItem('RUB'),
          getListItem('JPY'),
          getListItem('GBP'),
          getListItem('USD'),
        ],
      ),
    );
  }

  Widget getListItem(String currency) {
    return InkWell(
      onTap: () {
        String currencyOne =
            widget.currencyNum == '1' ? currency : widget.currencyOne;
        String currencyTwo =
            widget.currencyNum == '2' ? currency : widget.currencyTwo;

        currencyservice()
            .doconversion(currencyOne, currencyOne)
            .then((value) => {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (context) => dashboard(
                        currencyVal: 0,
                        ConverterCurrency: value,
                        currencyone: currencyOne,
                        currencytwo: currencyTwo,
                        isWhite: false,
                      ),
                    ),
                  ),
                });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 20),
        child: Text(
          currency,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
