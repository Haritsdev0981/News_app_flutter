import 'package:flutter/material.dart';
import 'package:hello_world/model/article.dart';
import 'package:hello_world/screen/newspage.dart';
import 'package:hello_world/service/data_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
                image: NetworkImage(
                    'https://obs.line-scdn.net/0hCLKZrEfoHGN2Iwq0Ay9jNEx1HwxFTw9gEhVNfSZNQlRaQFozQ0EAUlQqRldTEVs9SUxTDVcjB1IORwk9HUAA/w644')),
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text(
          'Good Morning',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark),
            color: Colors.blue,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) => snapshot.data != null
            ? NewsPage(snapshot.data as List<Article>)
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
