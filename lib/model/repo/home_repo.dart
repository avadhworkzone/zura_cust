import 'dart:developer';
import 'package:wilatone_restaurant/model/apiModel/responseModel/home_page_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/search_restaurant%20_res_model.dart';
import 'package:wilatone_restaurant/model/apiService/api_service.dart';
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';

class HomeRepo extends BaseService{

  /// ===============================  Featch Category List ========================== ///

  Future<HomePageResModel> featchCategoryListRepo() async {

    var response = await ApiService().getResponse(apiType: APIType.aGet , url: homePage,);

    log("========Featch Category List=====RES:=========$response");
    HomePageResModel result = HomePageResModel.fromJson(response);

    return result;

  }


  /// ==========================   Search Restaurant List ========================== ///

  Future<SearchRestaurantsResModel> searchRestaurantListRepo() async {

    Map<String,dynamic> body = {
       "name" : "str"
    };

    var response = await ApiService().getResponse(apiType: APIType.aGet , url: searchRestaurant,body: body);

    log("========Search Restaurant List=====RES:=========$response");
    SearchRestaurantsResModel result = SearchRestaurantsResModel.fromJson(response);

    return result;

  }

}