int calculateReadingTime(String content){
  final wordCount = content.trim().split(RegExp(r'\s+')).length;

final readingTime = wordCount/200;
  return readingTime.ceil();
}