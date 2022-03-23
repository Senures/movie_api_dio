import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';
import 'package:movie_api/extension/extensions.dart';
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
              primary: false,
              shrinkWrap: true,
              itemCount: hc.list!.length,
              itemBuilder: (context, i) {
                var ite = hc.list![i];
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: Get.size.width * 0.4,
                      // height: Get.size.height * 0.2,
                      /*  decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 1.0,
                              color: Colors.white10,
                              style: BorderStyle.solid)

                          // color: Colors.blue,
                          ), */
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: Get.size.width * 0.3,
                            height: Get.size.height * 0.20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        ite["image_thumbnail_path"]),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              width: Get.size.width * 0.5,

                              //height: 150.0,

                              decoration: const BoxDecoration(
                                  color: Color(0xff221957),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                        color: Color(0xff4d3ea6))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ite["name"],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  const Divider(
                                    color: Colors.white24,
                                  ),
                                  movieText("Start date: ", ite["start_date"]),
                                  movieText("Status: ", ite["status"]),
                                  movieText("Country:", ite["country"])
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
              });
        });
  }
}

movieText(String text, String text2) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Text(
      text + text2,
      style: const TextStyle(color: Colors.white, fontSize: 13.0),
    ),
  );
}
