// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:wasteapp/screens/map/map_utils.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({Key? key}) : super(key: key);

//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: TextButton(
//               style: TextButton.styleFrom(backgroundColor: Colors.red),
//               onPressed: () {
//                 MapUtils.openMap(13.8178884, 100.5096905);
//               },
//               child: Text(
//                 'Open google map',
//                 style: TextStyle(color: Colors.white),
//               )),
//         ),
//       ),
//     );

//   }
// }

// ignore_for_file: prefer_is_empty, sized_box_for_whitespace, avoid_print, await_only_futures, prefer_void_to_null, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
          print('************************************name = ${model.nameshop}');
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
              ));
          
        },
        
        child: Card(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.network(
                  model.imgshop,
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: Column(
                  children: [
                    Text(model.nameshop),
                    Text(model.call),
                  ],
                ),
              )
              // Text(model.nameshop)
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
              : ListView(children: widgets)),
    );
  }
}
