import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled17/home/modal/news_modal.dart';

import '../provider/news_provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsProvider? newsProviderTrue;
  NewsProvider? newsProviderFalse;

  @override
  Widget build(BuildContext context) {
    newsProviderTrue = Provider.of<NewsProvider>(context, listen: true);
    newsProviderFalse = Provider.of<NewsProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    newsProviderFalse!.changeCountry("in");
                  },
                  child: Text("in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {
                    newsProviderFalse!.changeCountry("us");
                  },
                  child: Text("us",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {
                    newsProviderFalse!.changeCountry("kr");
                  },
                  child: Text("kr",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                TextButton(
                  onPressed: () {
                    newsProviderFalse!.changeCountry("cn");
                  },
                  child: Text("cn",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: newsProviderTrue!.getNews(
                    newsProviderTrue!.selestedCountry,
                    newsProviderTrue!.selectedcat),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold));
                  } else if (snapshot.hasData) {
                    NewsModal? newsmodal = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            height: MediaQuery.of(context).size.width * 0.9,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${newsProviderFalse!.NewsdataModal!.articles[index].urlToImage}"),
                                  fit: BoxFit.cover),
                            ),
                          ),

                          title: Text("${newsmodal.articles[index].title}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text("${newsmodal.articles[index].author}",
                              style: TextStyle(
                                color: Colors.white70,
                              )),
                        );
                      },
                      itemCount: newsmodal!.articles.length,
                    );
                  }
                  return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
