import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_tuitorial/cors/constants/constants.dart';
import 'package:flutter_clean_architecture_tuitorial/cors/resources/data_state.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/data/models/article.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sorces/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl({required NewsApiService newsApiService})
      : _newsApiService = newsApiService;

  @override
  Future<DataState<List<ArticleModel>>> getNewArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewArticle(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == 200) {
        // Ensure httpResponse.data is of type List<ArticleModel>
        return DataSuccess(httpResponse.data, null);
      } else {
        return DataFailed(
          null, // Pass null for the data parameter
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: 'Failed to load articles: ${httpResponse.response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(null, e); 
    }
  }
}