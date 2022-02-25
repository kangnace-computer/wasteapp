// ignore_for_file: prefer_const_constructors, prefer_if_null_operators, unnecessary_null_comparison, avoid_unnecessary_containers, unused_local_variable, unused_element
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/screens/map/map_utils.dart';
import 'package:wasteapp/widgets/model/shop_model.dart';

class DetailPage extends StatefulWidget {
  final ShopModel shopModel;
  const DetailPage({Key? key, required this.shopModel}) : super(key: key);
  

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ShopModel model;
  @override
  void initState() {
    super.initState();
    model = widget.shopModel;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 9,
        title: Text(
          model.nameshop == null ? 'Shop Name' : model.nameshop,
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
    // double h = MediaQuery.of(context).size.height;
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
            alignment: Alignment.centerLeft,
            child: Text(
              model.nameshop,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Container(
            child: Text(
              model.location,
              style: TextStyle(color: kTextColor, fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              model.optime,
              style: TextStyle(color: kTextColor, fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              model.call,
              style: TextStyle(color: kTextColor, fontSize: 20),
            ),
          ),
          Container(
            child: Text(
              model.web,
              style: TextStyle(color: kTextColor, fontSize: 20),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                print(
                    "https://www.google.com/maps/search/?api=1&query=${model.shoplat},${model.shoplong}");
              },
              child: Text('Open Link'),
            ),
          ),
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
            image: NetworkImage(model.imgshop), fit: BoxFit.cover),
      ),
    );
  }
}
