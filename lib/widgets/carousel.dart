import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';
import 'package:movie_api/detail/detay_view/detay_view.dart';
import 'package:movie_api/home/home_controller/home_controller.dart';

class CarouselList extends StatelessWidget {
  const CarouselList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return CarouselSlider(
              items: hc.popularlist
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        Get.to(() => DetayView(detailId: item["id"]));
                      },
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: Get.size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          /*   boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 1.0,
                                spreadRadius: 1.0)
                          ], */
                          /* border:
                            Border.all(width: 2, color: Colors.white.withOpacity(0.2)), */
                          //color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                item["image_thumbnail_path"],
                              )),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                child: const Icon(
                                  Icons.star_rounded,
                                  color: Color(0xffeceded),
                                  size: 20.0,
                                ),
                              ).asGlass(
                                frosted: true,
                                tileMode: TileMode.clamp,
                                clipBorderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0)),
                              ),
                            ),
                            /*  Align(
                                                    alignment: Alignment.bottomCenter,
                                                    child: Container(
                                                        alignment: Alignment.center,
                                                        width: Get.size.width,
                                                        height: Get.size.height * 0.04,
                                                        child: Text(
                                                          "ssas",
                                                          style: const TextStyle(
                                                              color: Color(0xffeceded),
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight.w700),
                                                        )).asGlass(
                                                      frosted: true,
                                                    ),
                                                  ) */
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: Get.size.height * 0.3,
                aspectRatio: 16 / 9,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              ));
        });
  }
}
