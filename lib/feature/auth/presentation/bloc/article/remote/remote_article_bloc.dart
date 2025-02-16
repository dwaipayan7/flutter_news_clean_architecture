import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_tuitorial/cors/resources/data_state.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/domain/usecase/article_usecase.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {

    on<GetArticles>(_onGetArticles);

  }

  FutureOr<void> _onGetArticles(GetArticles event, Emitter<RemoteArticlesState> emit) async{

    final dataState = await _getArticleUseCase(NoParams);

    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemoteArticlesDone(articles: dataState.data!));
    }else{
      emit(RemoteArticlesFailed(error: dataState.error!));
    }

  }
}
