import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFrame extends StatelessWidget {
  const NewsFrame({
    Key? key,
    required this.title,
    required this.newsImage,
    required this.author,
    required this.story,
    required this.url,
  }) : super(key: key);

  final String title;
  final String newsImage;
  final String author;
  final String story;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.00),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(Icons.newspaper, size: 25),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: Image(
                image: NetworkImage(newsImage),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('- by $author'),
              ],
            ),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.all(25.00),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  story,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
            TextButton(
              onPressed: () {
                launch(url);
              },
              child: Text(
                'click on this link to know more',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 3.00,
              ),
            )
          ],
        ),
      ),
    );
  }
}
