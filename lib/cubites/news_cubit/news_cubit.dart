import 'package:flutter_application_2/servieses/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  void fetchTopHeadlines({String lang = 'en', String? country, int max = 20}) async {
    emit(NewsLoading());
    try {
      final articles = await DioHelper.getTopHeadlines(
        lang: lang,
        country: country,
        max: max,
      );
      emit(NewsSuccess(articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  void searchNews({
    required String query,
    String lang = 'en',
    String? country,
    String? from,
    String? to,
    int max = 20,
  }) async {
    emit(NewsLoading());
    try {
      final articles = await DioHelper.searchNews(
        query: query,
        lang: lang,
        country: 'eg',
        from: from,
        to: to,
        max: 20,
      );
      emit(NewsSuccess(articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}