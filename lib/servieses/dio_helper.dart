import 'package:dio/dio.dart';
import 'package:flutter_application_2/models/news_model.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<List<NewsModel>> getTopHeadlines({
    String lang = 'en',
    String? country,
    int max = 20,
  }) async {
    try {
      final response = await dio!.get(
        'top-headlines',
        queryParameters: {
          'apiKey': 'ccd4c1d353634f499e391115492afe9e',
          'language': lang,
          if (country != null) 'country': country,
          'pageSize': max,
        },
      );

      final articles = response.data['articles'] as List;
      return articles.map((article) => NewsModel.fromJson(article)).toList();
    } catch (e) {
      throw Exception('Failed to fetch top headlines: $e');
    }
  }

  static Future<List<NewsModel>> searchNews({
    required String query,
    String lang = 'en',
    String? country,
    String? from,
    String? to,
    String sortBy = 'publishedAt',
    int max = 20,
  }) async {
    try {
      final response = await dio!.get(
        'everything',
        queryParameters: {
          'apiKey': 'ccd4c1d353634f499e391115492afe9e',
          'q': query,
          'language': lang,
          if (country != null) 'country': country,
          if (from != null) 'from': from,
          if (to != null) 'to': to,
          'sortBy': sortBy,
          'pageSize': max,
        },
      );

      final articles = response.data['articles'] as List;
      return articles.map((article) => NewsModel.fromJson(article)).toList();
    } catch (e) {
      throw Exception('Failed to search news: $e');
    }
  }
}
