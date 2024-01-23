// To parse this JSON data, do
//
//     final verifyOtpResModel = verifyOtpResModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpResModel verifyOtpResModelFromJson(String str) => VerifyOtpResModel.fromJson(json.decode(str));

String verifyOtpResModelToJson(VerifyOtpResModel data) => json.encode(data.toJson());

class VerifyOtpResModel {
  int? code;
  String? message;
  Data? data;

  VerifyOtpResModel({
    this.code,
    this.message,
    this.data,
  });

  factory VerifyOtpResModel.fromJson(Map<dynamic, dynamic> json) => VerifyOtpResModel(
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
  bool? isMobileVerified;
  String? accessToken;
  bool? isSocial;
  dynamic deviceToken;
  dynamic deviceName;
  String? name;
  String? email;
  String? areaName;

  Data({
    this.isMobileVerified,
    this.accessToken,
    this.isSocial,
    this.deviceToken,
    this.deviceName,
    this.name,
    this.email,
    this.areaName,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    isMobileVerified: json["is_mobile_verified"],
    accessToken: json["accessToken"],
    isSocial: json["is_social"],
    deviceToken: json["device_token"],
    deviceName: json["device_name"],
    name: json["name"],
    email: json["email"],
    areaName: json["area_name"],
  );

  Map<dynamic, dynamic> toJson() => {
    "is_mobile_verified": isMobileVerified,
    "accessToken": accessToken,
    "is_social": isSocial,
    "device_token": deviceToken,
    "device_name": deviceName,
    "name": name,
    "email": email,
    "area_name": areaName,
  };
}
