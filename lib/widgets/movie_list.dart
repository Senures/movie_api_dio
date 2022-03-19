import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';
import 'package:movie_api/home/home_controller/home_controller.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return ListView.builder(
              // controller: hc.controller,
              //primary: false,
              shrinkWrap: true,
              itemCount: hc.list!.length,
              itemBuilder: (context, i) {
                var ite = hc.list![i];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: Get.size.width * 0.4,
                    height: Get.size.height * 0.2,
                    // color: Colors.grey.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(ite["image_thumbnail_path"]),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 180.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              // color: Colors.blue,
                              ),
                          child: Text(ite["name"]),
                        ),
                      ],
                    ),
                  ).asGlass(
                      tintColor: Colors.white.withOpacity(0.1), frosted: true),
                );
              });
        });
  }
}
