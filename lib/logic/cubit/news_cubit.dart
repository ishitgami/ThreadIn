import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thread_in/data/data_provider/data_provider.dart';
import 'package:thread_in/data/modules/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final DataProvider dataProvider;
  NewsCubit({required this.dataProvider}) : super(NewsInitial());

  void fetchNEWS() {
    print('inUserCubit1');
    dataProvider.fetchNEWS().then((news) {
       print('news--->$news');
      emit(NewsLoaded(news: news));
    });
  }
}
