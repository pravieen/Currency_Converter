// ignore_for_file: camel_case_types

import 'package:currency_converter/currencyservice.dart';
import 'package:flutter/material.dart';
import 'constraints/fonts.dart';

class blackpage_input extends StatefulWidget {
  const blackpage_input(
      {super.key, required this.origCurreny, required this.convCurrency});

  final convCurrency;
  final origCurreny;

  @override
  State<blackpage_input> createState() => _blackpage_inputState();
}

class _blackpage_inputState extends State<blackpage_input> {
  @override
  num currInput = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {},
              child: const Center(
                  child: Text('tap to delete', style: currenchangefont)),
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
                    color: Colors.white),
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
                color: const Color.fromARGB(255, 89, 88, 88)),
            child: Center(
              child: Text(
                num1.toString(),
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
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
                color: const Color.fromARGB(255, 89, 88, 88)),
            child: Center(
              child: Text(
                num2.toString(),
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
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
                color: const Color.fromARGB(255, 89, 88, 88)),
            child: Center(
              child: Text(
                num3.toString(),
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
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
                  color: const Color.fromARGB(255, 89, 88, 88)),
              child: const Center(
                child: Text(
                  '.',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
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
                  color: const Color.fromARGB(255, 89, 88, 88)),
              child: const Center(
                child: Text(
                  '0',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              currencyservice().convertCurrency(widget.origCurreny,
                  widget.convCurrency, currInput, context, "2");
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: const Center(
                child: Icon(
                  Icons.check,
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
