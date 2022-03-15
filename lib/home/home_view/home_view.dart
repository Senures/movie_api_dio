import 'package:carousel_slider/carousel_slider.dart';
import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_api/home/home_controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return Scaffold(
              backgroundColor: const Color(0xff132d4e).withOpacity(0.4),
              body: hc.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : SafeArea(
                      child: Container(
                        width: Get.size.width,
                        height: Get.size.height,
                        decoration: BoxDecoration(
                            // color: const Color(0xff090a0e).w,
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: Get.size.width * 0.6,
                                    height: Get.size.height * 0.07,
                                    //color: Colors.red,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Hello Esma",
                                          style: TextStyle(
                                              color: Color(0xffeceded),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0),
                                        ),
                                        Text(
                                          "Bookk your favorite movie",
                                          style: TextStyle(
                                              color: Color(0xff9ca4ad)),
                                        )
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    maxRadius: 22.0,
                                    backgroundColor: Color(0xffeceded),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Container(
                                  width: Get.size.width * 0.8,
                                  height: Get.size.height * 0.06,
                                ).asGlass(
                                    frosted: false,
                                    clipBorderRadius:
                                        BorderRadius.circular(10.0),
                                    tintColor: Colors.white.withOpacity(0.3))),
                            /* Container(
                              width: 300.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ), */

                            Padding(
                              padding: const EdgeInsets.only(left: 45),
                              child: Text(
                                "Most Popular TV Shows",
                                style: TextStyle(
                                    color: Color(0xffeceded),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0),
                              ),
                            ),
                            CarouselSlider(
                                items: hc.images
                                    .map((item) => Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          width: Get.size.width * 0.8,
                                          height: Get.size.height * 0.3,
                                          child: Image.network(
                                            item,
                                            fit: BoxFit.cover,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                  height: 400,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  // onPageChanged: callbackFunction,
                                  scrollDirection: Axis.horizontal,
                                )),
                          ],
                        ),
                      ),
                    ));
        });
  }
}
