import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoView extends StatelessWidget {
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: Get.size.width,
            height: Get.size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xff221957),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                ]),
            child: Image.network(
              dp,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
