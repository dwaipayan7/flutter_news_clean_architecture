import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_tuitorial/cors/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/article.dart';
part 'news_api_service.g.dart';


@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService{

  factory NewsApiService(Dio di) = _NewsApiService;


  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewArticle({

    @Query("apiKey") String ? apiKey,
    @Query("country") String? country,
    @Query("category") String? category


  });


}