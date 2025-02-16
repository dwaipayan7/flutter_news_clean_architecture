import 'package:flutter_clean_architecture_tuitorial/cors/resources/data_state.dart';
import 'package:flutter_clean_architecture_tuitorial/cors/usecase/usecase.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/domain/entities/article.dart';

import '../repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void>{

  final ArticleRepository _articleRepository;

  GetArticleUseCase(ArticleRepository articleRepository) : _articleRepository = articleRepository;

  @override
  Future<DataState<List<ArticleEntity>>> call(void params) {
    return _articleRepository.getNewArticle();
  }

}

class NoParams{}