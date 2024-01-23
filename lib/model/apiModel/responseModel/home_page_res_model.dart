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
  String? categoryList;
  String? bannerList;
  int? savedTillDate;
  String? restaurantList;

  Data({
    this.categoryList,
    this.bannerList,
    this.savedTillDate,
    this.restaurantList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categoryList: json["category_list"],
    bannerList: json["banner_list"],
    savedTillDate: json["saved_till_date"],
    restaurantList: json["restaurant_list"],
  );

  Map<String, dynamic> toJson() => {
    "category_list": categoryList,
    "banner_list": bannerList,
    "saved_till_date": savedTillDate,
    "restaurant_list": restaurantList,
  };
}
