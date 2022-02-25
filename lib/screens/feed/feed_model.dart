import 'dart:convert';

class FeedModel {
  final String name;
  final String imgfeed;
  final String detail;
  final String url;
  FeedModel({
    required this.name,
    required this.imgfeed,
    required this.detail,
    required this.url,
  });

  FeedModel copyWith({
    String? name,
    String? imgfeed,
    String? detail,
    String? url,
  }) {
    return FeedModel(
      name: name ?? this.name,
      imgfeed: imgfeed ?? this.imgfeed,
      detail: detail ?? this.detail,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgfeed': imgfeed,
      'detail': detail,
      'url': url,
    };
  }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      name: map['name'] ?? '',
      imgfeed: map['imgfeed'] ?? '',
      detail: map['detail'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedModel.fromJson(String source) => FeedModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FeedModel(name: $name, imgfeed: $imgfeed, detail: $detail, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FeedModel &&
      other.name == name &&
      other.imgfeed == imgfeed &&
      other.detail == detail &&
      other.url == url;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      imgfeed.hashCode ^
      detail.hashCode ^
      url.hashCode;
  }
}
