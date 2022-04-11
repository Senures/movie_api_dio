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
  List<TvShows>? list = [];
  List<TvShows>? searchlist = [];
  List<TvShows> popularlist = [];
  List<String> images = [];
  bool isPageLoading = false;

  bool searching = false;

  int currentPage = 1;

  ScrollController? controller;

  @override
  void onInit() {
    controller = ScrollController();
    controller!.addListener(() {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        isPageLoading = true;
    
        currentPage = currentPage + 1;
        
        getHomeApiList();
        update();
      } else {}
    });

    getPopularList();
    super.onInit();
  }

  setIsloading(bool b) {
    isLoading = b;
    update();
  }

  getHomeApiList() async {
    apiValue = await HomeService().getHomeApi(currentPage);
    if (list == null) {
      list = apiValue!.tvShows;
      setIsloading(false);
      //eğer liste boş ise

    } else {
      for (var item in apiValue!.tvShows!) {
        list!.add(item);
      } //bu her sayfa aşağı indiğinde listenin sonuna ekliyor
      setIsloading(false);
      isPageLoading = false;
      update();
    }
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
    if (searchlist == null) {
      searchlist = search!.tvShows;
      setIsloading(false);
    
    } else {
      for (var item in search!.tvShows!) {
        searchlist!.add(item);
      } 
      setIsloading(false);
      isPageLoading = false;
      update();
    }
  }

  clearSearch() {
    searchcontroller.clear();
    update();
  }
 
}
