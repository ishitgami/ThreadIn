import 'package:dio/dio.dart';

import '../modules/news_model.dart';

class DioClient {
  final Dio dio = Dio();
  static const baseURL = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=15fe8b68135647f1b431901a359c8869";
  // static const userEndPoint = baseURL + '/users';
  // static const postEndPoint = baseURL + '/posts';

  //  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "15fe8b68135647f1b431901a359c8869";
  // var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';


  Future<NewsModel> fetchNews() async {
    try {
      final response = await dio.get(baseURL);
      return NewsModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      throw Exception('Failed to load News');
    }
  }

}
