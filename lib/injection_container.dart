import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/data/data_sorces/remote/news_api_service.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/data/repository/article_repository_impl.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/domain/repository/article_repository.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/domain/usecase/article_usecase.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {

  sl.registerSingleton<Dio>(Dio());


  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  
  
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(newsApiService: sl()));


  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));


  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));


}