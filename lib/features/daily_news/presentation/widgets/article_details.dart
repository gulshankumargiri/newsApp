import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/articles.dart';
import 'package:news_app/features/daily_news/presentation/bloc/provider/saved_article.dart';
import 'package:news_app/features/daily_news/presentation/widgets/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/util/data_time_formatter.dart';
import '../../../../core/util/reading_time_calculator.dart';
import '../../../../core/util/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
 final ArticleEntity article;
  const ArticleDetails({super.key, required  this.article});


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CNN - Updates',),
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(
          top: 14,
          bottom: 14,
          end: 14,
          start: 14,
        ),
        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(),
            _buildImage(context),
            _buidlDescription(),
          ],
        ),
      ),
    );
  }

 // title and date
 Widget _buildTitle(){
   return  Column(
     spacing: 10,
     children: [
       Text(article.title!,
         softWrap: true,
         // maxLines: 3,
         style: const TextStyle(
           color: Colors.black,
           fontSize: 18,
           fontWeight: FontWeight.w900,
         ),
       ),
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         spacing: 3,
         children: [
           Text('By the ${article.author!} ',
             style: const TextStyle(
               color: Colors.black45,
               fontSize: 13,
               fontWeight: FontWeight.w900,
             ),
           ),
           Row(
             children: [
               const Icon(Icons.watch_later_outlined,
                 size: 14,
               ),
               const SizedBox(width: 5),
               Text(
                ' ${calculateReadingTime(article.content.toString())} minute read' ,
                 style: const TextStyle(fontSize: 14,color: Colors.black38),
               ) ],
           ),
           Text(
             'Published: ${FormateDateBydmmyyyy(DateTime.parse(article.publishedAt.toString()))} ',
             style: const TextStyle(fontSize: 14,color: Colors.black38),
           )
         ],
       ),
     ],
   );
 }
 // images
 Widget _buildImage(BuildContext context) {
   return CachedNetworkImage(
     imageUrl: article.urlToImage!,
     height:  300,
     width:  MediaQuery.of(context).size.width,

     imageBuilder:
         (context, ImageProvider) => Padding(
       padding: const EdgeInsetsDirectional.all(4),
       child: ClipRRect(
         borderRadius: const BorderRadius.all(Radius.circular(10)),
         child: Container(
           height: double.maxFinite,
           width: MediaQuery.of(context).size.width,
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
       padding: const EdgeInsetsDirectional.all(4),
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
       padding: const EdgeInsetsDirectional.all(4),
       child: Container(
         height: double.maxFinite,
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(color: Colors.black12.withAlpha(2)),
         child: const Icon(Icons.error),
       ),
     ),
   );
 }
//  Description
Widget _buidlDescription(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(article.description!,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(article.content!),
       const SizedBox(
          height: 20,
        ),
         // Launching url of the Article.
         ArticleLinkWidget(url: article.url!)
      ],
    );
        
}

}
