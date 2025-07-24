import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';

import '../../../../core/util/data_time_formatter.dart';
import '../bloc/provider/saved_article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleWidget({super.key, required this.article});
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsetsDirectional.only(
        top: 14,
        bottom: 14,
        end: 14,
        start: 14,
      ),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(children: [
        // Image
        _buildImage(context),
        // Title and Description
        _buildTitleandDescription(context)]),
    );
  }

  // Image
  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article!.urlToImage!,
      imageBuilder:
          (context, ImageProvider) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: Colors.black12.withAlpha(2),
                  image: DecorationImage(
                    image: ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
      progressIndicatorBuilder:
          (context, url, downloadProgress) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: Colors.black12.withAlpha(2)),
                child: const CupertinoActivityIndicator(),
              ),
            ),
          ),
      errorWidget:
          (context, ulr, error) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: Container(
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(color: Colors.black12.withAlpha(2)),
              child: const Icon(Icons.error),
            ),
          ),
    );
  }
  // description
  Widget _buildTitleandDescription(BuildContext context) {
    var savedArt = context.watch<ArticleProvider>().savedList;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(
              article!.title ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(article!.description ?? "", maxLines: 2),
              ),
            ),

            // publishAt
            Row(
              children: [
                const Icon(Icons.timeline_sharp),
                const SizedBox(width: 5),
                Text(
                    "${FormateDateBydmmyyyy(DateTime.parse(article!.publishedAt.toString())) } ",
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 20,),
                // saved & unsaved button
                IconButton(
                    onPressed: () {
                      if(!savedArt.contains(article)){
                        context.read<ArticleProvider>().saveArticle(article!);
                      }else{
                        context.read<ArticleProvider>().removeArticle(article!);

                      }
                    },
                icon: Icon(Icons.save,
                color:savedArt.contains(article) ? Colors.red : Colors.black,
                )

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
