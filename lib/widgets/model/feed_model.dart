import 'dart:convert';

class FeedModel {
  final String name;
  final String imgfeed;
  final String detail;
  FeedModel({
    required this.name,
    required this.imgfeed,
    required this.detail,
  });

  FeedModel copyWith({
    String? name,
    String? imgfeed,
    String? detail,
  }) {
    return FeedModel(
      name: name ?? this.name,
      imgfeed: imgfeed ?? this.imgfeed,
      detail: detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgfeed': imgfeed,
      'detail': detail,
    };
  }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      name: map['name'] ?? '',
      imgfeed: map['imgfeed'] ?? '',
      detail: map['detail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedModel.fromJson(String source) => FeedModel.fromMap(json.decode(source));

  @override
  String toString() => 'FeedModel(name: $name, imgfeed: $imgfeed, detail: $detail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FeedModel &&
      other.name == name &&
      other.imgfeed == imgfeed &&
      other.detail == detail;
  }

  @override
  int get hashCode => name.hashCode ^ imgfeed.hashCode ^ detail.hashCode;
}
