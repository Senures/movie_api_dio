import 'package:dio/dio.dart';

import 'package:movie_api/entity/detail_model.dart';

class DetailService{
 Dio dio=Dio();

   Future<DetailModel?> getDetail(int detailId) async{
  String url = "https://www.episodate.com/api/show-details?q=$detailId";
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return DetailModel.fromJson(response.data);
    }
 }

}