import 'package:currency_converter/currencyservice.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'constraints/fonts.dart';

class whitepage_input extends StatefulWidget {
  const whitepage_input(
      {super.key, required this.origCurreny, required this.convCurrency});

  final convCurrency;
  final origCurreny;
  @override
  State<whitepage_input> createState() => _whitepage_inputState();
}

class _whitepage_inputState extends State<whitepage_input> {
  num currInput = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {},
              child: const Center(
                  child: Text('tap to delete', style: currenchangefontwhite)),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                currInput.toString(),
                style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            numButtons(1, 2, 3),
            const SizedBox(
              height: 30,
            ),
            numButtons(4, 5, 6),
            const SizedBox(
              height: 30,
            ),
            numButtons(7, 8, 9),
            const SizedBox(
              height: 30,
            ),
            finalrow(),
          ],
        ),
      ),
    );
  }

  Widget numButtons(num1, num2, num3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            calculatenum(num1);
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color.fromARGB(255, 227, 224, 224)),
            child: Center(
              child: Text(
                num1.toString(),
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculatenum(num2);
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 227, 224, 224)),
            child: Center(
              child: Text(
                num2.toString(),
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculatenum(num3);
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromARGB(255, 227, 224, 224)),
            child: Center(
              child: Text(
                num3.toString(),
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget finalrow() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              //calculatenum(9);
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromARGB(255, 227, 224, 224)),
              child: const Center(
                child: Text(
                  '.',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              calculatenum(0);
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 227, 224, 224)),
              child: const Center(
                child: Text(
                  '0',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              currencyservice().convertCurrency(widget.origCurreny,
                  widget.convCurrency, currInput, context, "1");
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.black),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  calculatenum(number) {
    setState(() {
      currInput = currInput * 10 + number;
    });
  }
}
