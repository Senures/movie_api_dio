import 'dart:ui';

import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/extension/extensions.dart';
import 'package:movie_api/home/home_controller/home_controller.dart';
import 'package:movie_api/widgets/carousel.dart';
import 'package:movie_api/widgets/circularProgress.dart';
import 'package:movie_api/widgets/movie_list.dart';
import 'package:movie_api/widgets/search_list.dart';
import 'package:movie_api/widgets/sized_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return Scaffold(
              backgroundColor: const Color(0xff221957),
              body: hc.isLoading
                  ? Center(
                      child: customCircularProgress(),
                    )
                  : SafeArea(
                      child: SizedBox(
                        width: Get.size.width,
                        height: Get.size.height,
                        child: SingleChildScrollView(
                          controller: hc.controller,
                          primary: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customTitle(),
                              CustomSizedBox(height: Get.size.height * 0.02),
                              customSearch(),
                              CustomSizedBox(height: Get.size.height * 0.03),
                              hc.searchcontroller.text.isEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "Most Popular TV Shows".homeText(),
                                        CustomSizedBox(
                                            height: Get.size.height * 0.03),
                                        const CarouselList(),
                                        "All Shows".homeText(),
                                        const MovieList()
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            "Search Result".homeText(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30.0),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    hc.clearSearch();
                                                  },
                                                  child: hc.searchlist!.isEmpty
                                                      ? const SizedBox()
                                                      : Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width:
                                                              Get.size.width *
                                                                  0.08,
                                                          height:
                                                              Get.size.height *
                                                                  0.04,
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0xff221957),
                                                              borderRadius: BorderRadius.circular(5.0),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    blurRadius:
                                                                        1.0,
                                                                    spreadRadius:
                                                                        1.0,
                                                                    color: Color(
                                                                        0xff4d3ea6))
                                                              ]),
                                                          child: const Icon(
                                                            Icons.arrow_back,
                                                            color: Color(
                                                                0xffeceded),
                                                            size: 25.0,
                                                          ))),
                                            )
                                          ],
                                        ),
                                        hc.searchlist!.isEmpty
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                alignment: Alignment.center,
                                                width: Get.size.width,
                                                height: Get.size.height * 0.4,
                                                //color: Colors.red,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: Get.size.width * 0.9,
                                                  height:
                                                      Get.size.height * 0.20,

                                                  //color: Colors.white,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .search_off_rounded,
                                                        size: 50.0,
                                                        color:
                                                            Color(0xff4d3ea6),
                                                      ),
                                                      const Text(
                                                        "No results found for your match",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffeceded),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16.0),
                                                      ),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                const Color(
                                                                    0xff4d3ea6),
                                                          ),
                                                          onPressed: () {
                                                            hc.clearSearch();
                                                          },
                                                          child: const Text(
                                                              "Back to Home"))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : const SearchList()
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ));
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
        SizedBox(
            //color: Colors.red,
            width: Get.size.width * 0.06,
            height: Get.size.height * 0.06,
            child: Image.asset(
              "assets/app_icon.png",
              color: const Color(0xffeceded),
              width: 35.0,
            )),
        SizedBox(
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
  var hc = Get.put(HomeController());
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
          padding: const EdgeInsets.all(14.0),
          width: Get.size.width * 0.68,
          height: Get.size.height * 0.06,
          decoration: BoxDecoration(
              color: const Color(0xff221957),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    color: Color(0xff4d3ea6))
              ]),
          child: TextFormField(
            style: const TextStyle(color: Color(0xffb9b5b3)),
            controller: hc.searchcontroller,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(top: 10.0),
              isDense: true,
              border: InputBorder.none,
              hintText: "Search movies,series",
              hintStyle: TextStyle(color: Color(0xffb9b5b3)),
            ),
          )),
      GestureDetector(
        onTap: () {
          if (hc.searchlist != null) {
            hc.searchlist!.clear();
          }
          hc.getSearchList();
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff4d3ea6),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(12.0),
          width: Get.size.width * 0.13,
          height: Get.size.height * 0.06,
          child: Image.asset(
            "assets/search_icon.png",
            color: const Color(0xffeceded),
          ),
        ),
      )
    ],
  );
}
