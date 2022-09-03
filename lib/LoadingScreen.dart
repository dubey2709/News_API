import 'package:api_practice/Networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'NewsData.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    reqData();
  }

  void reqData() async {
    var data = await NetworkHelper().getData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => newsData(data)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitSpinningLines(
        color: Colors.black,
        size: 100,
      ),
    );
  }
}
