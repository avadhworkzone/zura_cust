import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/model/repo/home_repo.dart';

class HomeViewModel  extends GetxController{

  RxBool isLoading = false.obs;
  RxString data = "om".obs;
  ApiResponse homePageApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse searchRestaurantApiResponse = ApiResponse.initial('INITIAL');

  ///  Featch category name

  Future<void> categoryList() async {
    homePageApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await HomeRepo().featchCategoryListRepo();
      homePageApiResponse = ApiResponse.complete(response);
    }

    catch(e){

      if(kDebugMode){
        Get.back();
        print('homePageApiResponse ERROR  :=>$e');
      }
      homePageApiResponse = ApiResponse.error('ERROR');
    }

    update();
  }

  /// search-restaurant

  Future<void> searchRestaurantList() async {

    searchRestaurantApiResponse = ApiResponse.loading('Loading');
    update();

    try {
      final response = await HomeRepo().searchRestaurantListRepo();
      searchRestaurantApiResponse = ApiResponse.complete(response);
    }
    catch (e) {

      if(kDebugMode){
        Get.back();
        print('searchRestaurantApiResponse ERROR  :=>$e');
      }
      searchRestaurantApiResponse = ApiResponse.error('ERROR');
    }

    update();
  }

}