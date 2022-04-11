import 'package:flutter/material.dart';

extension HomeTextExtension on String {
  Widget homeText() {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(
        this,
        style: const TextStyle(
            color: Color(0xffeceded),
            fontWeight: FontWeight.w500,
            fontSize: 20.0),
      ),
    );
  }
}
