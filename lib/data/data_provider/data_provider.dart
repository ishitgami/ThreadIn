import 'package:thread_in/data/dio/dio_news.dart';
import 'package:thread_in/data/modules/news_model.dart';

class DataProvider{
  final DioClient dioClient;

  DataProvider({required this.dioClient});

  Future<NewsModel> fetchNEWS() async {
     print('indataProvider1');
    final newsRaw = await dioClient.fetchNews();

    print('newsRaw--->${newsRaw.articles?.first.author}');
    print('indataProvider2');
    return newsRaw;
  }

}
  