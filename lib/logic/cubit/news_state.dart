part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsLoaded extends NewsState {
 
  final NewsModel news;
  NewsLoaded({required this.news});

  get users => null;
}