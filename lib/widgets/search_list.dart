import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/detail/detail_view/detail_view.dart';
import 'package:movie_api/home/home_controller/home_controller.dart';
import 'package:movie_api/widgets/movie_list.dart';

class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: hc.searchlist!.length,
              itemBuilder: (context, i) {
                var ite = hc.searchlist![i];
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: Get.size.width * 0.4,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => DetailView(detailId: ite.id!));
                        },
                        child: Row(
                          children: [
                            Container(
                              width: Get.size.width * 0.3,
                              height: Get.size.height * 0.20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: NetworkImage(ite
                                                  .imageThumbnailPath ==
                                              "https://static.episodate.com/"
                                          ? 'https://cpmr-islands.org/wp-content/uploads/sites/4/2019/07/Happy-Test-Screen-01-825x510.png'
                                          : ite.imageThumbnailPath ??
                                              'https://cpmr-islands.org/wp-content/uploads/sites/4/2019/07/Happy-Test-Screen-01-825x510.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                width: Get.size.width * 0.5,

                                //height: 150.0,

                                decoration: const BoxDecoration(
                                    color: Color(0xff221957),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          color: Color(0xff4d3ea6))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ite.name!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    const Divider(
                                      color: Colors.white24,
                                    ),
                                    movieText(
                                        "Start date: ", ite.startDate ?? ""),
                                    movieText("Status: ", ite.status ?? ""),
                                    movieText("Country:", ite.country ?? "")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              });
        });
  }
}
