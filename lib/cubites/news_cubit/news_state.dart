import 'package:flutter_application_2/models/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<NewsModel> articles;

  NewsSuccess(this.articles);
}

class NewsError extends NewsState {
  final String error;

  NewsError(this.error);
}