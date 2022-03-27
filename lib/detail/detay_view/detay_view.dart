import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';
import 'package:movie_api/detail/detay_controller/detay_controller.dart';
import 'package:movie_api/detail/detay_view/photo.dart';
import 'package:movie_api/widgets/circularProgress.dart';
import 'package:url_launcher/url_launcher.dart';

class DetayView extends StatelessWidget {
  int detailId;
  DetayView({Key? key, required this.detailId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetayController>(
        init: DetayController(detailId: detailId),
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
                        child: Container(
                          width: Get.size.width,
                          height: Get.size.height * 0.45,
                          color: Colors.red,
                          child: Image.network(
                            dc.detail!.imagePath.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          top: Get.size.height * 0.27,
                          right: Get.size.width * 0.05,
                          child: Container(
                            width: Get.size.width * 0.10,
                            height: Get.size.height * 0.05,
                            child: IconButton(
                                onPressed: () async {
                                  if (await canLaunch(
                                      dc.detail!.url.toString())) {
                                    await launch(dc.detail!.url.toString());
                                  } else {
                                    throw "could not launch ";
                                  }
                                },
                                icon: const Icon(
                                  Icons.share,
                                  size: 25.0,
                                  color: Colors.white,
                                )),
                            decoration:
                                const BoxDecoration(color: Color(0xff4d3ea6)),
                            //color: Color(0xff4d3ea6),
                          )),
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
                              Container(
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
                                            width: 120.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(dp),
                                                    fit: BoxFit.cover)),
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
                                    Container(
                                      height: 30.0,
                                      //color: Colors.white,
                                      child: Row(
                                        children: [
                                          Text(
                                            double.parse(dc.detail!.rating!)
                                                .toStringAsFixed(2),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Text("⭐⭐⭐⭐⭐")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.white.withOpacity(0.4),
                              ),
                              Container(
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
                                            //width: Get.size.width * 0.2,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(7.0),
                                            child: Text(
                                              dc.genreslist![indeks],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )).asGlass(
                                            tileMode: TileMode.mirror,
                                            // frosted: false,
                                            clipBorderRadius:
                                                BorderRadius.circular(5.0)),
                                      );
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: Container(
                                  width: Get.size.width * 0.8,
                                  //color: Colors.red,
                                  child: Text(
                                    dc.detail!.description.toString(),
                                    maxLines: 10,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xffb9b5b3),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
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
                                          child: Container(
                                            width: Get.size.width * 0.5,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(10.0),
                                                  padding: EdgeInsets.all(10.0),
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
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        "Episode " +
                                                            item.episode
                                                                .toString(),
                                                        style: TextStyle(
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
                                                  child: Container(
                                                    child: Text(item.name!,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
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
