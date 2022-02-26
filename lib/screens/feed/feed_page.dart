// ignore_for_file: prefer_is_empty, sized_box_for_whitespace, avoid_print, await_only_futures, prefer_void_to_null, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/screens/feed/detail_page.dart';
import 'package:wasteapp/screens/feed/feed_model.dart';


class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Widget> widgets = [];
  List<FeedModel> feedModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('feed')
          .snapshots()
          .listen((event) {
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          FeedModel model = FeedModel.fromMap(map);
          feedModels.add(model);
          setState(
            () {
              widgets.add(createWidget(model, index));
            },
          );
          index++;
        }
      });
      print('เชื่อต่อ ฐานข้อมูลสำหรับหน้า feed สำเร็จ');
    });
  }

  Widget createWidget(FeedModel model, int index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  feedModel: feedModels[index],
                ),
              ));
          print('You Click = $index');
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.network(model.imgfeed),
              ),
              SizedBox(height: 5),
              Text(model.name)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        body: widgets.length == 0
            ? Center(child: CircularProgressIndicator())
            : GridView.extent(maxCrossAxisExtent: 350, children: widgets),
            // :ListView(children: widgets)
            
      ),
    );
  }
}
