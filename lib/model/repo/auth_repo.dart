import 'dart:developer';
import 'package:wilatone_restaurant/model/apiModel/responseModel/home_page_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/send_otp_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/social_login_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/update_profile_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/verify_otp_res_model.dart';
import 'package:wilatone_restaurant/model/apiService/api_service.dart';
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';

class AuthRepo extends BaseService {

  /// ============================= SEND OTP  ============================== ///

  Future<SendOtpResModel> sendOtpRepo(String pNumber, bool isSendAPI) async {

    Map<String, dynamic> body = {
      "mobile": pNumber,
    };

    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        withToken: false,
        body: body,
        url: isSendAPI ? sendOtp : reSendOtp);

    log("=============RES:=========$response");
    SendOtpResModel result = SendOtpResModel.fromJson(response);
    log("result :- ${result.message}===============================");
    return result;
  }

  /// =============================  Verify OTP  ============================== ///
  Future<VerifyOtpResModel> verifyOtpRepo(String pNumber,String otp) async {

    Map<dynamic, dynamic> body = {
      "code": otp,
      "mobile": pNumber,
    };

    var response = await ApiService().getResponse(
        apiType: APIType.aPost, withToken: false, body: body, url: verifyOtp);

    log("=============RES:=========$response");
    VerifyOtpResModel result = VerifyOtpResModel.fromJson(response);

    return result;
  }

  ///  ============================== Update Profile Email and Name======================= ///

  Future<UpdateProfileResModel> updateProfileRepo(String name, String email) async {

    Map<String, dynamic> body = {

      "name": name,
      "email": email,

    };

    var response = await ApiService().getResponse(
        apiType: APIType.aPost , body: body, url: updateProfile,);

    log("=============RES:=========$response");
    UpdateProfileResModel result = UpdateProfileResModel.fromJson(response);

    return result;
  }

  ///  ============================== Update Profile Area======================= ///

  Future<UpdateProfileResModel> updateProfileAreaRepo(String area) async {

    Map<String, dynamic> body = {

      "area_name": area,


    };

    var response = await ApiService().getResponse(
      apiType: APIType.aPost , body: body, url: updateProfile,);

    log("=============RES:=========$response");
    UpdateProfileResModel result = UpdateProfileResModel.fromJson(response);

    return result;
  }


  /// ===============================  Featch Category List ========================== ///

  Future<HomePageResModel> featchCategoryListRepo() async {

  var response = await ApiService().getResponse(apiType: APIType.aGet , url: homePage,);

    log("========Featch Category List=====RES:=========$response");
    HomePageResModel result = HomePageResModel.fromJson(response);

    return result;

  }

  /// =============================  SOCIAL LOGIN  ============================== ///

  Future<SocialLoginResModel> socialLoginRepo(String encryptedData) async {
    Map<String, dynamic> body = {
      "data": encryptedData,
    };

    var response = await ApiService().getResponse(
        apiType: APIType.aPost, body: body, url: socialLogin, withToken: false);

    log("=============SocialLoginResModel RES:=========$response");
    SocialLoginResModel result = SocialLoginResModel.fromJson(response);

    return result;
  }
}
