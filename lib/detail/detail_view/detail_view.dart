import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';
import 'package:movie_api/detail/detail_controller/detail_controller.dart';
import 'package:movie_api/detail/detail_view/photo.dart';
import 'package:movie_api/widgets/circularProgress.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  int detailId;
  DetailView({Key? key, required this.detailId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(detailId: detailId),
        builder: (dc) {
          return Scaffold(
            backgroundColor: const Color(0xff221957),
            body: dc.isLoading
                ? Center(
                    child: customCircularProgress(),
                  )
                : Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: Get.size.width,
                          height: Get.size.height * 0.45,
                          //  color: Colors.red,
                          child: Image.network(
                            dc.detail!.imagePath.toString(),
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }

                              return Center(
                                child: customCircularProgress(),
                              );
                            },
                          ),
                        ),
                      ),
                      dc.detail!.url!.isNotEmpty
                          ? Positioned(
                              top: Get.size.height * 0.27,
                              right: Get.size.width * 0.05,
                              child: Container(
                                width: Get.size.width * 0.10,
                                height: Get.size.height * 0.05,
                                child: IconButton(
                                    onPressed: () async {
                                      await launch(dc.detail!.url!);
                                    },
                                    icon: const Icon(
                                      Icons.share,
                                      size: 25.0,
                                      color: Colors.white,
                                    )),
                                decoration: BoxDecoration(
                                    color: const Color(0xff4d3ea6),
                                    borderRadius: BorderRadius.circular(5.0)),
                                //color: Color(0xff4d3ea6),
                              ))
                          : const SizedBox(),
                      Positioned(
                        top: Get.size.height * 0.35,
                        left: 15.0,
                        right: 15.0,
                        bottom: 0.0,
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.size.width,
                                height: Get.size.height * 0.18,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: dc.pictures!.length,
                                    itemBuilder: (context, i) {
                                      var dp = dc.pictures![i];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 5.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => PhotoView(dp: dp));
                                          },
                                          child: Container(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            width: 120.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Image.network(
                                              dp,
                                              fit: BoxFit.cover,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }

                                                return Center(
                                                  child:
                                                      customCircularProgress(),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ).asGlass(
                                frosted: false,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dc.detail!.name.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                      //color: Colors.white,
                                      child: Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 17.0,
                                            initialRating: double.parse(dc
                                                    .detail!.rating
                                                    .toString()) /
                                                2,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "(" +
                                                double.parse(dc.detail!.rating
                                                        .toString())
                                                    .toStringAsFixed(2) +
                                                ")",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.white.withOpacity(0.4),
                              ),
                              SizedBox(
                                width: Get.size.width,
                                height: Get.size.height * 0.07,
                                //color: Colors.amber,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: dc.genreslist!.length,
                                    itemBuilder: (context, indeks) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.all(7.0),
                                                child: Text(
                                                  dc.genreslist![indeks],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ))
                                            .asGlass(
                                                tileMode: TileMode.mirror,
                                                clipBorderRadius:
                                                    BorderRadius.circular(5.0)),
                                      );
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: SizedBox(
                                  width: Get.size.width * 0.8,
                                  //color: Colors.red,
                                  child: Text(
                                    dc.detail!.description.toString(),
                                    maxLines: 10,
                                    style: const TextStyle(
                                      color: Color(0xffb9b5b3),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.size.width,
                                height: Get.size.height * 0.15,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: false,
                                    itemCount: dc.episodelist!.length,
                                    itemBuilder: (context, index) {
                                      var item = dc.episodelist![index];
                                      return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: Get.size.width * 0.5,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.all(
                                                      10.0),
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff221957),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            blurRadius: 1.0,
                                                            spreadRadius: 1.0,
                                                            color: Color(
                                                                0xff4d3ea6))
                                                      ]),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        "Season " +
                                                            item.season
                                                                .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        "Episode " +
                                                            item.episode
                                                                .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15.0),
                                                  child: Text(item.name!,
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                )
                                              ],
                                            ),
                                          ));
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
