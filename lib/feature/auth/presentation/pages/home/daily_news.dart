import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_architecture_tuitorial/feature/auth/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(),

    body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        "Daily News",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }


  _buildBody(){
    return BlocBuilder<RemoteArticleBloc, RemoteArticlesState>(
        builder: (_, state){
          if(state is RemoteArticlesLoading){
            return Center(child: CupertinoActivityIndicator());
          }

          if(state is RemoteArticlesFailed){
            return Center(child: Text(state.error.toString()));

          }

          if(state is RemoteArticlesDone){
            return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(state.articles![index].title!),
                  subtitle: Text(state.articles![index].description!),
                );
              },
            );
          }

          return SizedBox.shrink();
        }
    );
  }
}
