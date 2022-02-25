import 'dart:convert';

class ShopModel {
  final String imgshop;
  final String nameshop;
  final String location;
  final String shoplat;
  final String shoplong;
  final String web;
  final String call;
  final String optime;
  final String type;
  ShopModel({
    required this.imgshop,
    required this.nameshop,
    required this.location,
    required this.shoplat,
    required this.shoplong,
    required this.web,
    required this.call,
    required this.optime,
    required this.type,
  });

  ShopModel copyWith({
    String? imgshop,
    String? nameshop,
    String? location,
    String? shoplat,
    String? shoplong,
    String? web,
    String? call,
    String? optime,
    String? type,
  }) {
    return ShopModel(
      imgshop: imgshop ?? this.imgshop,
      nameshop: nameshop ?? this.nameshop,
      location: location ?? this.location,
      shoplat: shoplat ?? this.shoplat,
      shoplong: shoplong ?? this.shoplong,
      web: web ?? this.web,
      call: call ?? this.call,
      optime: optime ?? this.optime,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imgshop': imgshop,
      'nameshop': nameshop,
      'location': location,
      'shoplat': shoplat,
      'shoplong': shoplong,
      'web': web,
      'call': call,
      'optime': optime,
      'type': type,
    };
  }

  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      imgshop: map['imgshop'] ?? '',
      nameshop: map['nameshop'] ?? '',
      location: map['location'] ?? '',
      shoplat: map['shoplat'] ?? '',
      shoplong: map['shoplong'] ?? '',
      web: map['web'] ?? '',
      call: map['call'] ?? '',
      optime: map['optime'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopModel.fromJson(String source) => ShopModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShopModel(imgshop: $imgshop, nameshop: $nameshop, location: $location, shoplat: $shoplat, shoplong: $shoplong, web: $web, call: $call, optime: $optime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShopModel &&
      other.imgshop == imgshop &&
      other.nameshop == nameshop &&
      other.location == location &&
      other.shoplat == shoplat &&
      other.shoplong == shoplong &&
      other.web == web &&
      other.call == call &&
      other.optime == optime &&
      other.type == type;
  }

  @override
  int get hashCode {
    return imgshop.hashCode ^
      nameshop.hashCode ^
      location.hashCode ^
      shoplat.hashCode ^
      shoplong.hashCode ^
      web.hashCode ^
      call.hashCode ^
      optime.hashCode ^
      type.hashCode;
  }
}
