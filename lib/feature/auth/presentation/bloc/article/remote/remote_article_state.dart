
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading() : super(articles: null, error: null);
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone({required List<ArticleEntity> articles})
      : super(articles: articles, error: null);
}

class RemoteArticlesFailed extends RemoteArticlesState {
  const RemoteArticlesFailed({required DioError error})
      : super(articles: null, error: error);
}