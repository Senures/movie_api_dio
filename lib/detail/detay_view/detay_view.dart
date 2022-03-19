import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';
import 'package:movie_api/detail/detay_controller/detay_controller.dart';

class DetayView extends StatelessWidget {
  int detailId;
  DetayView({Key? key, required this.detailId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetayController>(
        init: DetayController(detailId: detailId),
        builder: (dc) {
          return Scaffold(
            backgroundColor: const Color(0xff3d6190).withOpacity(0.3),
            body: dc.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
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
                        top: Get.size.height * 0.35,
                        left: 15.0,
                        right: 15.0,
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
                                      child: Container(
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            /*  boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  blurRadius: 1.0,
                                                  spreadRadius: 1.0)
                                            ], */
                                            image: DecorationImage(
                                                image: NetworkImage(dp),
                                                fit: BoxFit.cover)),
                                      ),
                                    );
                                  }),
                            ).asGlass(
                                frosted: false,
                                //clipBorderRadius: BorderRadius.circular(15.0),
                                tintColor: Colors.white.withOpacity(0.1)),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dc.detail!.name.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  Container(
                                    height: 30.0,
                                    //color: Colors.white,
                                    child: Row(
                                      children: [
                                        Text(
                                          double.parse(dc.detail!.rating!)
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text("⭐⭐⭐⭐⭐")
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
                                          // width: Get.size.width * 0.3,
                                          /* decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: const Color(0xff3d6190),
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                    color: Colors.white)
                                              ]), */
                                          child: Text(
                                            dc.genreslist![indeks],
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  style: TextStyle(
                                    color: Color(0xffb9b5b3),
                                  ),
                                ),
                              ),
                            ),
                            /*   Container(
                              width: Get.size.width,
                              height: Get.size.height * 0.06,
                              color: Colors.amber,
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
                                          padding: const EdgeInsets.all(5.0),
                                          // width: Get.size.width * 0.3,
                                          /* decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: const Color(0xff3d6190),
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                    color: Colors.white)
                                              ]), */
                                          child: Text(
                                            dc.genreslist![indeks],
                                            style:
                                                TextStyle(color: Colors.white),
                                          )).asGlass(frosted: false),
                                    );
                                  }),
                            ) */
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
                                          alignment: Alignment.center,
                                          width: Get.size.width * 0.6,
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(10.0),
                                                width: Get.size.width * 0.5,
                                                height: Get.size.height * 0.03,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text("Season " +
                                                        item.season.toString()),
                                                    Icon(
                                                      Icons
                                                          .video_collection_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    Text("Episode " +
                                                        item.episode
                                                            .toString()),
                                                  ],
                                                ),
                                              ),
                                              Text(item.name.toString()),
                                            ],
                                          ),
                                        ).asGlass(
                                            tintColor:
                                                Colors.white.withOpacity(0.3)));
                                  }),
                            )
                          ],
                        ),
                      )

                      /*   Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
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
                                        child: Container(
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.white,
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0)
                                              ],
                                              image: DecorationImage(
                                                  image: NetworkImage(dp),
                                                  fit: BoxFit.cover)),
                                        ),
                                      );
                                    }),
                              ).asGlass(
                                  frosted: false,
                                  //clipBorderRadius: BorderRadius.circular(15.0),
                                  tintColor: Colors.white.withOpacity(0.1)),
                            ),
                            Text(
                              dc.detail!.name.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              child: Container(
                                width: Get.size.width * 0.8,
                                color: Colors.red,
                                child: Text(
                                  dc.detail!.description.toString(),
                                  maxLines: 10,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Color(0xffb9b5b3)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Container(
                                width: Get.size.width,
                                height: Get.size.height * 0.06,
                                color: Colors.amber,
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
                                            padding: const EdgeInsets.all(5.0),
                                            // width: Get.size.width * 0.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: const Color(0xff3d6190),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      blurRadius: 1.0,
                                                      spreadRadius: 1.0,
                                                      color: Colors.white)
                                                ]),
                                            child: Text(
                                              dc.genreslist![indeks],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      );
                                    }),
                              ),
                            )
                          ],
                        ),
                      ), */
                      ,
                    ],
                  ),
          );
        });
  }
}
