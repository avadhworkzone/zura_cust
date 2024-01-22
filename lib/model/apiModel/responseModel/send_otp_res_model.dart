// To parse this JSON data, do
//
//     final sendOtpResModel = sendOtpResModelFromJson(jsonString);

import 'dart:convert';

SendOtpResModel sendOtpResModelFromJson(String str) => SendOtpResModel.fromJson(json.decode(str));

String sendOtpResModelToJson(SendOtpResModel data) => json.encode(data.toJson());

class SendOtpResModel {
  int? code;
  String? message;
  int? data;

  SendOtpResModel({
    this.code,
    this.message,
    this.data,
  });

  factory SendOtpResModel.fromJson(Map<String, dynamic> json) => SendOtpResModel(
    code: json["code"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}
