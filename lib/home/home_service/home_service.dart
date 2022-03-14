import 'package:dio/dio.dart';
import 'package:movie_api/entity/api_model.dart';

class HomeService {
  Dio dio = Dio();

  getHomeApi(int page) async {
    String url = "https://www.episodate.com/api/most-popular?page=$page";
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return Model.fromJson(response.data);
    }
  }
}
