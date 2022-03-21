import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoView extends StatelessWidget {
  var dp;
  PhotoView({Key? key, required this.dp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width * 0.3,
      height: Get.size.height * 0.03,
      color: const Color(0xff3d6190).withOpacity(0.3),
      child: Image.network(
        dp,
        fit: BoxFit.cover,
      ),
    );
  }
}
