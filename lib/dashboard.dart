// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:currency_converter/blacpage_input.dart';
import 'package:currency_converter/currency_list.dart';
import 'package:currency_converter/whitepage_input.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'constraints/fonts.dart';
import 'package:flutter/cupertino.dart';

class dashboard extends StatefulWidget {
  const dashboard(
      {super.key,
      this.currencyVal,
      this.ConverterCurrency,
      this.currencyone,
      this.currencytwo,
      this.isWhite});

  final currencyVal;
  final ConverterCurrency;
  final currencyone;
  final currencytwo;
  final isWhite;

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 85,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          // ignore: prefer_const_constructors
                          builder: (context) => currency_list(
                                currencyNum: '1',
                                currencyOne: widget.currencyone,
                                currencyTwo: widget.currencytwo,
                              )));
                    },
                    child: Text(
                      widget.currencyone,
                      style: currencyname,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => blackpage_input(
                              origCurreny: widget.currencyone,
                              convCurrency: widget.currencytwo)));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: currencyVal,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65.5),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black,
                          width: 5,
                          style: BorderStyle.solid),
                    ),
                    child: widget.isWhite
                        ? const Icon(
                            Icons.arrow_upward_rounded,
                            size: 60,
                          )
                        : const Icon(Icons.arrow_downward_rounded, size: 60),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => whitepage_input(
                              origCurreny: widget.currencyone,
                              convCurrency: widget.currencytwo)));
                    },
                    child: Text(
                      widget.ConverterCurrency.toString(),
                      style: currencyVal2,
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          // ignore: prefer_const_constructors
                          builder: (context) => currency_list(
                                currencyNum: '2',
                                currencyOne: widget.currencyone,
                                currencyTwo: widget.currencytwo,
                              )));
                    },
                    child: Text(
                      widget.currencytwo,
                      style: currencyname2,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
