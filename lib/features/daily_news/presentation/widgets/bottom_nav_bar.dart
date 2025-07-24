import 'package:flutter/material.dart';
import 'package:news_app/config/routes/all_pages_route.dart';

import '../pages/home/daliy_news.dart';
import '../pages/saved_article/saved_article.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                // if (ModalRoute.of(context)?.settings.name != '/') {
                  Navigator.of(context).pushReplacementNamed(AppRoute.home);
                //   // Navigator.pushNamed(context, AppRoute.home);
                //   print(AppRoute.home);
                //
                // }

                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const DailyNews()));
              },
              icon:const Icon(Icons.home)),

          IconButton(
               icon: const Icon(Icons.storage),
             onPressed: () {
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const SavedArticle()));
             },),

        ],
      ),
    );
  }
}
