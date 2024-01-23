import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManagerUtils {

  static final getStorage = GetStorage();
  static late SharedPreferences sharedPreferences;
  static String dialCode = 'dialCode';
  static String countryCode = "countryCode";
  static String allCountryCurrency = "countryCode";
  static String countryName = "countryName";
  static String accessToken =  'gettoken';

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

  static Future<void> initSharePreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setLoginUserData(bool value) async {
    await sharedPreferences.setBool(accessToken, value);
  }

  static bool? getLoginUserData()  {
    return sharedPreferences.getBool(accessToken);
  }

}
