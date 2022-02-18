// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            items: urlImages
                .map((item) => Container(
                      child: Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}
