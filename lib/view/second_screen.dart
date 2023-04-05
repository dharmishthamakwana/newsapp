import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/provider/home_provider.dart';

class SecondSCreen extends StatefulWidget {
  const SecondSCreen({Key? key}) : super(key: key);

  @override
  State<SecondSCreen> createState() => _SecondSCreenState();
}

class _SecondSCreenState extends State<SecondSCreen> {
  HomeProvider? homeProviderfalse;
  HomeProvider? homeProvidertrue;

  @override
  Widget build(BuildContext context) {
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 255,
              width: double.infinity,
              color: Colors.white70,
              child: Image.network(
                '${homeProviderfalse!.articalList[homeProviderfalse!.i].urlToImage}',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              '${homeProviderfalse!.articalList[homeProviderfalse!.i].author}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                                '${homeProviderfalse!.articalList[homeProviderfalse!.i].publishedAt}',
                                style: TextStyle(color: Colors.black)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          '${homeProviderfalse!.articalList[homeProviderfalse!.i].title}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 25)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "________________________________________________________"),
                      SizedBox(height: 4),
                      Text('Description',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              letterSpacing: 1)),
                      Text(
                          "________________________________________________________"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${homeProviderfalse!.articalList[homeProviderfalse!.i].description}',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "________________________________________________________"),
                      Text('Content',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              letterSpacing: 1)),
                      Text(
                          "________________________________________________________"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${homeProviderfalse!.articalList[homeProviderfalse!.i].content}',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          "________________________________________________________"),
                      Text(' information',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Text(
                          "________________________________________________________"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${homeProviderfalse!.articalList[homeProviderfalse!.i].url}',
                          style: TextStyle(color: Colors.blue, fontSize: 13)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        " ${homeProviderfalse!.articalList[homeProviderfalse!.i].source!.name}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
