import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/model/repo/auth_repo.dart';

class AuthViewModel extends GetxController {

  ApiResponse sendOtpApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse verifyOtpApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse updateProfileApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse socialLoginApiResponse = ApiResponse.initial('INITIAL');



  /// SEND OTP
  Future<void> sendOtp(String phoneNumber, bool isSendAPI) async {
    sendOtpApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await AuthRepo().sendOtpRepo(phoneNumber, isSendAPI);
      sendOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      if (kDebugMode) {
        print('sendOtpApiResponse ERROR  :=>$e');
      }
      sendOtpApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }

  /// VERIFY OTP
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    verifyOtpApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await AuthRepo().verifyOtpRepo(phoneNumber, otp);
      verifyOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      if (kDebugMode) {
        print('verifyOtpApiResponse ERROR  :=> $e');
      }

      verifyOtpApiResponse = ApiResponse.error('ERROR');
      Get.back();
    }

    update();
  }

  /// Update Profile of Name and Email

  Future<void> updateProfile(String name, String email) async {
    updateProfileApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await AuthRepo().updateProfileRepo(name, email);
      updateProfileApiResponse = ApiResponse.complete(response);
    } catch (e) {
      if (kDebugMode) {
        Get.back();
        print('updateProfileApiResponse ERROR  :=>$e');
      }
      updateProfileApiResponse = ApiResponse.error('ERROR');
    }

    update();
  }

  /// Update Profile of Area

  Future<void> updateAreaProfile(String area) async {
    updateProfileApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await AuthRepo().updateProfileAreaRepo(area);
      updateProfileApiResponse = ApiResponse.complete(response);
    } catch (e) {
      if (kDebugMode) {
        Get.back();
        print('updateProfileApiResponse ERROR  :=>$e');
      }
      updateProfileApiResponse = ApiResponse.error('ERROR');
    }

    update();
  }




  /// SOCIAL LOGIN
  Future<void> socialLogin(String encryptedData) async {
    socialLoginApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await AuthRepo().socialLoginRepo(encryptedData);
      socialLoginApiResponse = ApiResponse.complete(response);
    } catch (e) {
      if (kDebugMode) {
        print('socialLoginApiResponse ERROR  :=>$e');
      }
      socialLoginApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }
}
