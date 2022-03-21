import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension HomeTextExtension on String {
  Widget homeText() {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                width: 1.0, color: Colors.white10, style: BorderStyle.solid)),
        child: Text(
          this,
          style: const TextStyle(
              color: Color(0xffeceded),
              fontWeight: FontWeight.w500,
              fontSize: 20.0),
        ),
      ),
    );
  }
}

extension SizedBoxExtension on SizedBox {
  Widget width({required double width}) {
    return SizedBox(width: width);
  }

  Widget height({required double? height}) {
    return SizedBox(
      height: height,
    );
  }
}
