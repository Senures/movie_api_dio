import 'package:carousel_slider/carousel_slider.dart';
import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/home/home_controller/home_controller.dart';
import 'package:movie_api/widgets/carousel.dart';
import 'package:movie_api/widgets/movie_list.dart';
import 'package:movie_api/widgets/sized_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return Scaffold(
            backgroundColor: Color(0xff3d6190).withOpacity(0.3),
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
                      decoration: const BoxDecoration(
                          // color: const Color(0xff090a0e).w,
                          ),
                      child: SingleChildScrollView(
                        controller: hc.controller,
                        primary: false,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTitle(),
                            CustomSizedBox(height: Get.size.height * 0.02),
                            customSearch(),
                            CustomSizedBox(height: Get.size.height * 0.04),
                            customText(),
                            CustomSizedBox(height: Get.size.height * 0.04),
                            const CarouselList(),
                            CustomSizedBox(height: Get.size.height * 0.02),
                            customText(),
                            const HomeList(),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}

customTitle() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            //color: Colors.red,
            width: Get.size.width * 0.06,
            height: Get.size.height * 0.06,
            child: Image.asset(
              "assets/app_icon.png",
              color: const Color(0xffeceded),
              width: 35.0,
            )),
        Container(
          width: Get.size.width * 0.2,
          // color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.notifications,
                color: Color(0xffeceded),
                size: 25.0,
              ),
              Icon(
                Icons.more_horiz_outlined,
                color: Color(0xffeceded),
                size: 25.0,
              )
            ],
          ),
        )
      ],
    ),
  );
}

customSearch() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        padding: EdgeInsets.all(14.0),
        width: Get.size.width * 0.68,
        height: Get.size.height * 0.06,
        child: Text(
          "Search movies,series",
          style: TextStyle(color: Color(0xffb9b5b3)),
        ),
      ).asGlass(
          frosted: false,
          clipBorderRadius: BorderRadius.circular(10.0),
          tintColor: Colors.white.withOpacity(0.3)),
      Container(
        padding: EdgeInsets.all(12.0),
        width: Get.size.width * 0.13,
        height: Get.size.height * 0.06,
        child: Image.asset(
          "assets/search_icon.png",
          color: Color(0xffeceded),
        ),
      ).asGlass(
          frosted: false,
          clipBorderRadius: BorderRadius.circular(10.0),
          tintColor: Colors.white.withOpacity(0.3)),
    ],
  );
}

customText() {
  return const Padding(
    padding: EdgeInsets.only(left: 45),
    child: Text(
      "Most Popular TV Shows",
      style: TextStyle(
          color: Color(0xffeceded),
          fontWeight: FontWeight.w500,
          fontSize: 20.0),
    ),
  );
}

/* carouselList() {
  var hc = Get.put(HomeController());
  CarouselSlider(
      items: hc.popularlist
          .map(
            (item) => Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: Get.size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 1.0,
                      spreadRadius: 1.0)
                ],
                /* border:
                    Border.all(width: 2, color: Colors.white.withOpacity(0.2)), */
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.cover,
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
} */
