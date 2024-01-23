// To parse this JSON data, do
//
//     final searchRestaurantsResModel = searchRestaurantsResModelFromJson(jsonString);

import 'dart:convert';

SearchRestaurantsResModel searchRestaurantsResModelFromJson(String str) => SearchRestaurantsResModel.fromJson(json.decode(str));

String searchRestaurantsResModelToJson(SearchRestaurantsResModel data) => json.encode(data.toJson());

class SearchRestaurantsResModel {
  int? code;
  String? message;
  Data? data;

  SearchRestaurantsResModel({
    this.code,
    this.message,
    this.data,
  });

  factory SearchRestaurantsResModel.fromJson(Map<String, dynamic> json) => SearchRestaurantsResModel(
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
  List<Restaurant>? restaurants;

  Data({
    this.restaurants,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    restaurants: json["restaurants"] == null ? [] : List<Restaurant>.from(json["restaurants"]!.map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": restaurants == null ? [] : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };
}

class Restaurant {
  int? id;
  String? storeName;
  String? address;
  String? shortAddress;
  List<Discount>? discount;

  Restaurant({
    this.id,
    this.storeName,
    this.address,
    this.shortAddress,
    this.discount,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    storeName: json["store_name"],
    address: json["address"],
    shortAddress: json["short_address"],
    discount: json["discount"] == null ? [] : List<Discount>.from(json["discount"]!.map((x) => Discount.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_name": storeName,
    "address": address,
    "short_address": shortAddress,
    "discount": discount == null ? [] : List<dynamic>.from(discount!.map((x) => x.toJson())),
  };
}

class Discount {
  int? discountPercentage;

  Discount({
    this.discountPercentage,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
    discountPercentage: json["discount_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "discount_percentage": discountPercentage,
  };
}
