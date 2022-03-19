import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomSizedBox extends StatelessWidget {
  double? height;
  double? width;
 CustomSizedBox({Key? key, this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
      width:width,
    );
  }
}