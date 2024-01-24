import 'dart:ffi';
import 'package:get_storage/get_storage.dart';

class PreferenceManagerUtils {

  static final getStorage = GetStorage();
  static String dialCode = 'dialCode';
  static String countryCode = "countryCode";
  static String allCountryCurrency = "countryCode";
  static String countryName = "countryName";
  static String getToken = 'gettoken';
  static String isLoggedIn = 'isLoggedIn';

  ///setCountryName
  static Future setCountryName(String value) async {
    await getStorage.write(countryName, value);
  }

  static String getCountryName() {
    return getStorage.read(countryName) ?? "IN";
  }

  ///setCountryCode
  static Future setCountryCode(String value) async {
    await getStorage.write(countryCode, value);
  }

  static String getCountryCode() {
    return getStorage.read(countryCode) ?? "91";
  }

  /// Set login user data

 static  Future saveAccessToken(String accessToken) async {
    await getStorage.write(getToken, accessToken ?? '');
  }

  static String getAccessToken(){
    return getStorage.read(getToken) ?? '';
  }

  /// Login and logout

  static  Future saveLoginData(bool value) async {
    await getStorage.write(isLoggedIn, value);
  }

  static bool getLoginData(){
    return getStorage.read(isLoggedIn) ?? false;
  }

}
