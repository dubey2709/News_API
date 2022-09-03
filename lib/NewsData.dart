import 'Networking.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'NewzFrame.dart';

class newsData extends StatefulWidget {
  newsData(this.data);
  var data;
  @override
  State<newsData> createState() => _newsDataState();
}

class _newsDataState extends State<newsData> {
  NetworkHelper networkHelper = NetworkHelper();
  String newsImage =
      "https://happydays365.org/no-news-is-good-news-day/no-news-is-good-news-day-september-11/";
  String author = 'No Author';
  String story = "No Content Available";
  String url = "www.google.com";
  String title = "No Title";

  @override
  void initState() {
    super.initState();
    addItem();
  }

  List<Widget> Newzz = [];
  void addItem() {
    for (int i = 0; i < 20; i++) {
      getStory();
      var newItem = NewsFrame(
          title: title,
          newsImage: newsImage,
          author: author,
          story: story,
          url: url);
      Newzz.add(newItem);
    }
  }

  void getStory() async {
    try {
      setState(() {
        int x = Random().nextInt(95);
        newsImage = widget.data['articles'][x]['urlToImage'];
        author = widget.data['articles'][x]['author'];
        story = widget.data['articles'][x]['content'];
        url = widget.data['articles'][x]['url'];
        title = widget.data['articles'][x]['title'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newzzzgram'),
        centerTitle: true,
        flexibleSpace: Container(
          color: Colors.black87,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 02),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black, Colors.black87])),
            child: Center(
              child: Text(
                'Latest News on your fingertips',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: Newzz,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black, Colors.black87])),
            padding: EdgeInsets.all(10.00),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Click Here to refresh',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(width: 20),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    elevation: 5.00,
                    onPressed: () {
                      Newzz.clear();
                      addItem();
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 02)
        ],
      ),
    );
  }
}
