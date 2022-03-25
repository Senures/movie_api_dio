import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_api/entity/api_model.dart';
import 'package:movie_api/home/home_service/home_service.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  TextEditingController searchcontroller = TextEditingController();
  Model? apiValue;
  Model? popular;
  Model? search;
  List<dynamic>? list;
  List<dynamic> popularlist = [];
  List<String> images = [];

  int deger = 1;

  ScrollController? controller;

  @override
  void onInit() {
    controller = ScrollController();
    controller!.addListener(() {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        deger = deger + 1;
        getHomeApiList();
        print("degerrrrrrr" + deger.toString());
        update();
      } else {
        print("a");
      }
    });

    getPopularList();
    super.onInit();
  }

  setIsloading(bool b) {
    isLoading = b;
    update();
  }

  getHomeApiList() async {
    apiValue = await HomeService().getHomeApi(deger);
    list = apiValue!.tvShows;
    print("homelist" + list.toString());
    setIsloading(false);
  }

  getPopularList() async {
    setIsloading(true);
    popular = await HomeService().getPopularList();
    for (int i = 0; i < 10; i++) {
      popularlist.add(popular!.tvShows![i]);
    }
    getHomeApiList();
  }

  getSearchList() async {
    setIsloading(true);
    search = await HomeService().getSearchApi(searchcontroller.text);
    list = apiValue!.tvShows;
    setIsloading(false);
    searchcontroller.clear();
  }
}
