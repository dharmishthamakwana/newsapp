import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled17/home/provider/news_provider.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  NewsProvider? HPTrue, HPFalse;

  @override
  Widget build(BuildContext context) {
    HPFalse = Provider.of<NewsProvider>(context, listen: false);
    HPTrue = Provider.of<NewsProvider>(context, listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("24/7 News"),
          actions: [
            Icon(Icons.menu),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.network(
                  "${HPFalse!.NewsdataModal!.articles![index].urlToImage}",
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${HPTrue!.NewsdataModal!.articles![index].source!.name}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.NewsdataModal!.articles![index].title}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.NewsdataModal!.articles![index].description}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffA7BBC7),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   "${}",
                      //   style: TextStyle(fontSize: 18),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
