import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class ProductStepper extends StatefulWidget {
  const ProductStepper({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductStepper> createState() => _ProductStepperState();
}

class _ProductStepperState extends State<ProductStepper> {
  final TextEditingController _stepperETController =
      TextEditingController(text: '1');

  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
          child: Card(
              color: _itemCount == 1 ? primarySoftColor : primaryColor,
              child: const Padding(
                padding: EdgeInsets.all(1.0),
                child: Icon(
                  CupertinoIcons.minus,
                  color: Colors.white,
                ),
              )),
          onTap: () {
            if (_itemCount > 1) {
              _itemCount--;
              _stepperETController.text = _itemCount.toString();
              setState(() {});
            } else {
              _itemCount = 1;
              _stepperETController.text = _itemCount.toString();
              setState(() {});
            }
          },
        ),
        SizedBox(
            width: 50,
            height: 30,
            child: TextFormField(
              enabled: false,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              controller: _stepperETController,
            )),
        InkWell(
            onTap: () {
              _itemCount++;
              _stepperETController.text = _itemCount.toString();
              setState(() {});
            },
            child: Card(
              color: primaryColor,
              child: const Padding(
                padding: EdgeInsets.all(1.0),
                child: Icon(
                  CupertinoIcons.plus,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
