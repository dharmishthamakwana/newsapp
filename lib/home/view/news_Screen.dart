import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen/view/home_Screen.dart';
import '../provider/news_provider.dart';
import 'new_Screen.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  NewsProvider? newsProviderTrue;
  NewsProvider? newsProviderFalse;

  @override
  Widget build(BuildContext context) {
    newsProviderTrue = Provider.of<NewsProvider>(context, listen: true);
    newsProviderFalse = Provider.of<NewsProvider>(context, listen: false);
    return DefaultTabController(
      length: 7,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Row(children: [
              Text(
                "24/7 News",
                style: TextStyle(fontSize: 25),
              )
            ]),
            actions: [Icon(Icons.menu,color: Colors.white,size: 40,)],
            bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              tabs: [
                Tab(text: "TOP NEWS", height: 40),
                Tab(text: "COUNTRY"),
                InkWell(
                    onTap: () {
                      newsProviderFalse!.chengeWork("HEALTH");
                    },
                    child: Tab(
                      text: "HEALTH",
                    )),
                InkWell(
                    onTap: () {
                      newsProviderFalse!.chengeWork("BUSINESS");
                    },
                    child: Tab(text: "BUSINESS")),
                InkWell(
                  onTap: () {
                    newsProviderFalse!.chengeWork("ENTERTAINMENT");
                  },
                  child: Tab(text: "ENTERTAINMENT"),
                ),
                InkWell(
                  onTap: () {
                    newsProviderFalse!.chengeWork("SPORTS");
                  },
                  child: Tab(text: "SPORTS"),
                ),
                InkWell(
                  onTap: () {
                    newsProviderFalse!.chengeWork("TECHNOLOGY");
                  },
                  child: Tab(text: "TECHNOLOGY"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              HomeScreen(),
              NewsScreen(),
              NewsScreen(),
              NewsScreen(),
              NewsScreen(),
              NewsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
