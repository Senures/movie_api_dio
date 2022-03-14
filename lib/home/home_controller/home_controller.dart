import 'package:get/get.dart';
import 'package:movie_api/entity/api_model.dart';
import 'package:movie_api/home/home_service/home_service.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  Model? apiValue;
  List<dynamic>? list;
  List<String> images = [];
  var map;

  @override
  void onInit() {
    getHomeApi();
    super.onInit();
  }

  setIsloading(bool b) {
    isLoading = b;
    update();
  }

  getHomeApi() async {
    setIsloading(true);
    apiValue = await HomeService().getHomeApi(1);
    list = apiValue!.tvShows;
    for (int i = 0; i < list!.length; i++) {
      print(list![i]["image_thumbnail_path"]);
      images.add(list![i]["image_thumbnail_path"]);
    }
    setIsloading(false);
  }
}
