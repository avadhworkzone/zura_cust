import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/preference_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/login_screen.dart';
import 'package:wilatone_restaurant/view/dashboard/dashboard_screen.dart';
import 'package:wilatone_restaurant/viewModel/auth_view_model.dart';
import 'package:wilatone_restaurant/viewModel/connectivity_view_model.dart';
import 'package:wilatone_restaurant/viewModel/home_view_model.dart';
import 'model/apiService/api_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



// ignore: must_be_immutable
class  MyApp  extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize : const Size(390, 844),
      child : GestureDetector(
        onTap : () => FocusManager.instance.primaryFocus?.unfocus(),
        child : GetMaterialApp(
          title : VariablesUtils.appName,
          theme : ThemeData(
            useMaterial3: true,
            fontFamily: AssetsUtils.poppins,
          ),
          debugShowCheckedModeBanner: false,
          home : PreferenceManagerUtils.getLoginData() == true ?  const DashBoardScreen() : const LoginScreen(),
        ),
      ),
    );
  }

  ApiService apiService = Get.put(ApiService());

  BaseService baseService = Get.put(BaseService());

  AuthViewModel authViewModel = Get.put(AuthViewModel());

  ConnectivityViewModel connectivityViewModel = Get.put(ConnectivityViewModel());

  final HomeViewModel homeViewModel = Get.put(HomeViewModel());
}