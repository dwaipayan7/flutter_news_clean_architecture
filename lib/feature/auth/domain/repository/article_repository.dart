import 'package:flutter_clean_architecture_tuitorial/cors/resources/data_state.dart';

import '../entities/article.dart';

abstract class ArticleRepository{

  Future<DataState<List<ArticleEntity>>> getNewArticle();

}