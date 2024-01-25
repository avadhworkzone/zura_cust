// To parse this JSON data, do
//
//     final homePageResModel = homePageResModelFromJson(jsonString);

import 'dart:convert';

HomePageResModel homePageResModelFromJson(String str) => HomePageResModel.fromJson(json.decode(str));

String homePageResModelToJson(HomePageResModel data) => json.encode(data.toJson());

class HomePageResModel {
  int? code;
  String? message;
  Data? data;

  HomePageResModel({
    this.code,
    this.message,
    this.data,
  });

  factory HomePageResModel.fromJson(Map<String, dynamic> json) => HomePageResModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<BannerListElement>? categoryList;
  List<BannerListElement>? bannerList;
  int? savedTillDate;
  List<dynamic>? restaurantList;

  Data({
    this.categoryList,
    this.bannerList,
    this.savedTillDate,
    this.restaurantList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categoryList: json["category_list"] == null ? [] : List<BannerListElement>.from(json["category_list"]!.map((x) => BannerListElement.fromJson(x))),
    bannerList: json["banner_list"] == null ? [] : List<BannerListElement>.from(json["banner_list"]!.map((x) => BannerListElement.fromJson(x))),
    savedTillDate: json["saved_till_date"],
    restaurantList: json["restaurant_list"] == null ? [] : List<dynamic>.from(json["restaurant_list"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category_list": categoryList == null ? [] : List<dynamic>.from(categoryList!.map((x) => x.toJson())),
    "banner_list": bannerList == null ? [] : List<dynamic>.from(bannerList!.map((x) => x.toJson())),
    "saved_till_date": savedTillDate,
    "restaurant_list": restaurantList == null ? [] : List<dynamic>.from(restaurantList!.map((x) => x)),
  };
}

class BannerListElement {
  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  BannerListElement({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerListElement.fromJson(Map<String, dynamic> json) => BannerListElement(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
