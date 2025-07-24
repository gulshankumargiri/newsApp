import 'package:equatable/equatable.dart';
// api ke result  me jo article class  a rha hai na uske
// liye ye article entity banaya hai ye bhi ek type ka model jaisa
// hi hai jisko ab
class ArticleEntity extends Equatable{
  final int ? id;
  final String ? author;
  final String ? title;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? content;
const ArticleEntity({

  this.id,
  this.author,
  this.title,
  this.description,
  this.url,
  this.urlToImage,
  this.publishedAt,
  this.content,

});

  @override
  // implement props
  List<Object?> get props =>[
    id,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,

  ];

}
