import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/provider/saved_article.dart';
import '../../widgets/bottom_nav_bar.dart';

class SavedArticle extends StatelessWidget {
  const SavedArticle({super.key});

  @override
  Widget build(BuildContext context) {
    var savedArticles = context.watch<ArticleProvider>().savedList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Articles ${savedArticles.length}'),
      ),
      body: Column(
        children: [
         savedArticles.isEmpty?
          const Center(child: Text('No Saved Articles')):
            Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:savedArticles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(savedArticles[index].title!),
                  subtitle: Text(savedArticles[index].description!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<ArticleProvider>().removeArticle(savedArticles[index]);
                }));
              },

            ))],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
