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
                            /* boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 4.0,
                                  blurRadius: 4.0,
                                  color: Colors.white10)
                            ], */
                            /*  border: Border.all(
                                width: 2.0,
                                color: Colors.white10,
                                style: BorderStyle.solid), */
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  item["image_thumbnail_path"],
                                )),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    width: Get.size.width * 0.09,
                                    height: Get.size.height * 0.05,
                                    decoration:
                                        BoxDecoration(color: Colors.black45),
                                    child: Icon(
                                      Icons.star_purple500_sharp,
                                      size: 18.0,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        )),
                  )
                  .toList(),
              options: CarouselOptions(
                height: Get.size.height * 0.28,
                aspectRatio: 16 / 9,
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
