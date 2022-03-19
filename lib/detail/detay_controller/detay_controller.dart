import 'package:get/get.dart';
import 'package:movie_api/detail/detay_service/detay_service.dart';
import 'package:movie_api/entity/detail_model.dart';

class DetayController extends GetxController {
  final int detailId;
  bool isLoading = true;
  TvShow? detail;
  DetailModel? detailmap;
  List<String>? pictures;
  List<String>? genreslist;
  List<Episodes>? episodelist;
  DetayController({required this.detailId});
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
    print(episodelist![0].name);
    setIsloading(false);
  }
}
