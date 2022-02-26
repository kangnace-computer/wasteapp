// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, await_only_futures, avoid_print, unused_local_variable, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/widgets/model/shop_model.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int activelIndex = 0;
  final urlImages = [
    'https://firebasestorage.googleapis.com/v0/b/fir-zerowaste-d10d3.appspot.com/o/feedCover%2F%E0%B9%81%E0%B8%A2%E0%B8%81%E0%B9%81%E0%B8%A5%E0%B9%89%E0%B8%A7%E0%B8%97%E0%B8%B4%E0%B9%89%E0%B8%87.png?alt=media&token=2e13fc9a-79e5-4fb9-882a-9ef69c779170',
    'https://firebasestorage.googleapis.com/v0/b/fir-zerowaste-d10d3.appspot.com/o/feedCover%2F%E0%B9%81%E0%B8%A2%E0%B8%81%E0%B8%81%E0%B9%88%E0%B8%AD%E0%B8%99%E0%B8%97%E0%B8%B4%E0%B9%89%E0%B8%87.png?alt=media&token=f35d388a-52aa-4185-8cc5-2141ee0e9626',
    'https://firebasestorage.googleapis.com/v0/b/fir-zerowaste-d10d3.appspot.com/o/feedCover%2F%E0%B8%82%E0%B8%A2%E0%B8%B0%E0%B8%A3%E0%B8%B5%E0%B9%84%E0%B8%8B%E0%B9%80%E0%B8%84%E0%B8%B4%E0%B8%A5.png?alt=media&token=9edffc2d-da6d-44cc-a427-6ddc3c23f6c9',
    'https://firebasestorage.googleapis.com/v0/b/fir-zerowaste-d10d3.appspot.com/o/feedCover%2F1557979544068-%E0%B8%82%E0%B8%B6%E0%B9%89%E0%B8%99%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%82%E0%B8%A2%E0%B8%B0.jpg?alt=media&token=7796c11b-dcba-40c5-9555-01154ac0e583',
  ];
  // List<Widget> widgets = [];
  // List<ShopModel> ShopModels = [];

  // @override
  // void initState() {
  //   super.initState();
  //   readData();
  // }

  // Future<void> readData() async {
  //   await Firebase.initializeApp().then((value) async {
  //     await FirebaseFirestore.instance
  //         .collection('shop')
  //         .snapshots()
  //         .listen((event) {
  //       int indexs = 0;
  //       for (var snapshots in event.docs) {
  //         Map<String, dynamic> map = snapshots.data();
  //         ShopModel model = ShopModel.fromMap(map);
  //         ShopModels.add(model);
  //         setState(
  //           () {
  //             // widgets.add(createWidget(model, index));
  //           },
  //         );
  //         indexs++;
  //       }
  //     });
  //     print('เชื่อต่อ ฐานข้อมูลสำหรับหน้า home สำเร็จ');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            items: urlImages
                .map(
                  (item) => Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1 / 1.4,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                print('${index} ${reason}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
