// ignore_for_file: prefer_const_constructors, prefer_if_null_operators, unnecessary_null_comparison, avoid_unnecessary_containers, avoid_print
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/screens/feed/feed_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final FeedModel feedModel;
  const DetailPage({Key? key, required this.feedModel}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late FeedModel model;
  @override
  void initState() {
    super.initState();
    model = widget.feedModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 9,
        title: Text(
          model.name == null ? 'Feed Name' : model.name,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildImgFeed(),
                SizedBox(height: 8.0),
                buildDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildDetail() {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: double.maxFinite,
      width: w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900,
            spreadRadius: -10.0,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            child: Text(
              model.name,
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Container(
            child: Text(
              model.detail,
              style: TextStyle(color: kTextColor, fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: model.url,
                  )),
                );
                // WebView(
                //   initialUrl: model.url,
                // );
                // print(model.url);
              },
              child: Text('more'))
        ],
      ),
    );
  }

  Container buildImgFeed() {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900,
            spreadRadius: -10.0,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
        image: DecorationImage(
            image: NetworkImage(model.imgfeed), fit: BoxFit.cover),
      ),
    );
  }
}
