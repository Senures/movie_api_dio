import 'package:get/get.dart';
import 'package:movie_api/detail/detail_service/detail_service.dart';
import 'package:movie_api/entity/detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends GetxController {
  final int detailId;
  bool isLoading = true;
  TvShow? detail;
  DetailModel? detailmap;
  List<String>? pictures;
  List<String>? genreslist;
  List<Episodes>? episodelist;
  DetailController({required this.detailId});
  @override
  void onInit() {
    getDetail();
    super.onInit();
  }

  setIsloading(bool b) {
    isLoading = b;
    update();
  }

  getDetail() async {
    setIsloading(true);
    detailmap = await DetailService().getDetail(detailId);
    detail = detailmap!.tvShow;

    pictures = detail!.pictures;
    genreslist = detail!.genres;
    episodelist = detail!.episodes;

    setIsloading(false);
  }

  clickUrl(String url) async {}
}
