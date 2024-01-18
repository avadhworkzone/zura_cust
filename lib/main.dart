import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/About%20Us/about_us.dart';
import 'package:wilatone_restaurant/view/all_menu_screen.dart';
import 'package:wilatone_restaurant/view/all_order_screen.dart';
import 'package:wilatone_restaurant/view/dashboard/all_brands.dart';
import 'package:wilatone_restaurant/view/dashboard/bottombar_screen.dart';
import 'package:wilatone_restaurant/view/help_and_support.dart';
import 'package:wilatone_restaurant/view/home/home_screen.dart';
import 'package:wilatone_restaurant/view/my_order.dart';
import 'package:wilatone_restaurant/view/profile_detail_screen.dart';

import 'view/setting_screen.dart';
import 'viewModel/connectivity_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}


// ignore: must_be_immutable
class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: GetMaterialApp(
        title: VariablesUtils.appName,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: AssetsUtils.poppins,
        ),
        debugShowCheckedModeBanner: false,
        home : const BottombarScreen(),
      ),
    );
  }

  ConnectivityViewModel connectivityViewModel = Get.put(ConnectivityViewModel());

}