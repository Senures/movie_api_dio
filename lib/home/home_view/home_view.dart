import 'package:carousel_slider/carousel_slider.dart';
import 'package:coverflow/coverflow.dart';
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
              backgroundColor: Color(0xff132d4e).withOpacity(0.4),
              body: hc.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : SafeArea(
                      child: Container(
                        width: Get.size.width,
                        height: Get.size.height,
                        color: Color(0xff090a0e).withOpacity(0.2),
                        child: Column(
                          children: [
                            Container(
                              width: 300.0,
                              height: 50.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 100.0,
                            ),
                            CarouselSlider(
                                items: hc.images
                                    .map((item) => Container(
                                          color: Colors.red,
                                          width: Get.size.width * 3,
                                          height: Get.size.height * 0.4,
                                          child: Image.network(
                                            item,
                                            fit: BoxFit.cover,
                                          ),
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
