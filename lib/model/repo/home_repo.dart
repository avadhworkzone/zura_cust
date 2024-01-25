import 'dart:developer';
import 'package:wilatone_restaurant/model/apiModel/responseModel/home_page_res_model.dart';
import 'package:wilatone_restaurant/model/apiService/api_service.dart';
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';

class HomeRepo extends BaseService {


  /// ===============================  Featch Category List ========================== ///

  Future<HomePageResModel> featchCategoryListRepo() async {

    var response = await ApiService().getResponse(apiType: APIType.aGet , url: homePage,);

    log("========Featch Category List=====RES:=========$response");
    HomePageResModel result = HomePageResModel.fromJson(response);

    return result;

  }
}