// ignore_for_file: prefer_is_empty, sized_box_for_whitespace, avoid_print, await_only_futures, prefer_void_to_null, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wasteapp/constants/constants.dart';
import 'package:wasteapp/screens/map/detail_page.dart';
import 'package:wasteapp/widgets/model/shop_model.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Widget> widgets = [];
  List<ShopModel> ShopModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('shop')
          .snapshots()
          .listen((event) {
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          ShopModel model = ShopModel.fromMap(map);
          ShopModels.add(model);
          setState(
            () {
              widgets.add(createWidget(model, index));
            },
          );
          index++;
        }
      });
      print('เชื่อต่อ ฐานข้อมูลสำหรับหน้า Shop สำเร็จ');
    });
  }

  Widget createWidget(ShopModel model, int index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                shopModel: ShopModels[index],
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.only(right: 10.0, left: 10.0),
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x411D2429),
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        model.imgshop,
                        width: 150,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.nameshop,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                              child: AutoSizeText(
                                model.location,
                                style:
                                    TextStyle(color: kTextColor, fontSize: 10),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(model.type),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 8),
                          child: IconButton(
                              onPressed: () async {
                                final url =
                                    'https://www.google.com/maps/search/?api=1&query=${model.shoplat},${model.shoplong}';
                                if (await canLaunch(url)) {
                                  await launch(url,
                                      forceWebView: true,
                                      enableJavaScript: true);
                                }
                              },
                              icon: Icon(
                                Icons.assistant_direction,
                                size: 30,
                                color: Colors.green,
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Card(
        //     clipBehavior: Clip.antiAliasWithSaveLayer,
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Stack(
        //           alignment: Alignment.bottomLeft,
        //           children: [
        //             Image.network(model.imgshop, fit: BoxFit.fitWidth),
        //             Text(
        //               model.nameshop,
        //               style: TextStyle(color: Colors.white, fontSize: 18.0),
        //             )
        //           ],
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        //           child: Column(
        //             children: <Widget>[
        //               Text(model.location),
        //               Text(model.optime)
        //             ],
        //           ),
        //         ),
        //         ButtonBar(
        //           children: [
        //             TextButton(
        //               onPressed: () {
        //                 print(model.location);
        //               },
        //               child: Text('more'),
        //             ),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          height: 38,
          child: TextField(
            textInputAction: TextInputAction.search,
            // onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: kPrimaryColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: kPrimaryLightColor),
                hintText: "Search..."),
          ),
        ),
        // elevation: 0,
        // backgroundColor: Colors.transparent,
        // // leading: t,
        // automaticallyImplyLeading: false,
        // title: TextFormField(
        //   textInputAction: TextInputAction.search,
        //   decoration: InputDecoration(
        //     hintText: 'search',
        //     enabledBorder: UnderlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Color(0x00000000),
        //         width: 1,
        //       ),
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //     focusedBorder: UnderlineInputBorder(
        //       borderSide: BorderSide(
        //         color: Color(0x00000000),
        //         width: 1,
        //       ),
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //     filled: true,
        //     suffixIcon: Icon(
        //       Icons.search,
        //       color: Colors.white,
        //       size: 22,
        //     ),
        //   ),
        // ),
      ),
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView(children: widgets),
    );
  }
}
