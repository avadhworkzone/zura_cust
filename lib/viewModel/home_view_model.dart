import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/model/repo/auth_repo.dart';

class HomeViewModel  extends GetxController{

  RxBool isLoading = false.obs;
  RxString data = "om".obs;
  ApiResponse homePageApiResponse = ApiResponse.initial('INITIAL');

  ///  Featch category name

  Future<void> categoryList() async {
    homePageApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await AuthRepo().featchCategoryListRepo();
      homePageApiResponse = ApiResponse.complete(response);
    }
    catch (e) {

      if(kDebugMode){
        Get.back();
        print('homePageApiResponse ERROR  :=>$e');
      }
      homePageApiResponse = ApiResponse.error('ERROR');
    }

    update();
  }

}