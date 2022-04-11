import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PhotoView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var dp;
  PhotoView({Key? key, required this.dp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black12,
      ),
      backgroundColor: Colors.black12,
      body: Center(
        child: Container(
          //clipBehavior: Clip.antiAliasWithSaveLayer,
          width: Get.size.width,
          height: Get.size.height * 0.3,
          /*    decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ), */
          child: Image.network(
            dp,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
