import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../widgets/article_details.dart';
import '../../widgets/article_widget.dart';
import '../../widgets/bottom_nav_bar.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_buildApbar(),
      body: _buildbody(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

// appbar
_buildApbar(){
return AppBar(
  title: const Text(
    "Today News ",
    style: TextStyle(
        color:Colors.black),),

);
}
//body of app
_buildbody(){
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_,state){
        if(state is RemoteArticlesLoading){
          return const Center(child: CircularProgressIndicator(),);
        }

         if(state is RemoteArticleError){
          return const Center(child: Icon(Icons.refresh),);
        }

        if(state is RemoteArticleDone){
          return ListView.builder(
              itemCount: state.articles?.length,
              itemBuilder:(context, index){
                return
                  InkWell(
                      onTap:(){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>
                                ArticleDetails(article:state.articles![index])));
                      },
                      child: ArticleWidget(article: state.articles![index],));
              },
          );

        }

        return const SizedBox();
      }

  );

}

