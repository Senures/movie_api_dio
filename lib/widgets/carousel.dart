import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                        //width: Get.size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                width: Get.size.width * 0.50,
                                //height: 170.0,
                                color: Colors.amber,
                                child: Image.network(
                                  item["image_thumbnail_path"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  //margin: EdgeInsets.all(8.0),
                                  //color: Colors.blue,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["name"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13.0),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      const Text(
                                        "⭐⭐⭐⭐⭐",
                                        style: TextStyle(fontSize: 10.0),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: Get.size.height * 0.38,
                aspectRatio: 16 / 8,
                viewportFraction: 0.4,
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
