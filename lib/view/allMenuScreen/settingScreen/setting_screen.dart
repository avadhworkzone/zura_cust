import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/preference_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/login_screen.dart';
import 'package:wilatone_restaurant/view/dashboard/bottombar_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const WileToneAppBar(title: VariablesUtils.setting),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: ColorUtils.greyEC, width: 1)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15.w,
                    ),
                    const WileToneImageWidget(
                      image: AppIconAssets.settingnotification,
                      imageType: ImageType.png,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WileToneTextWidget(
                          title: VariablesUtils.notification,
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                        WileToneTextWidget(
                          title: VariablesUtils.enable,
                          fontSize: 12.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w500,
                          color: ColorUtils.grey5B,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    SizedBox(
                      height: Get.width <= 280 ? 3.h : 5.h,
                      width: Get.width <= 280 ? 20.w : 30.w,
                      child: Switch(
                        value: light,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),

              GestureDetector(
                onTap: () async {
                  await PreferenceManagerUtils.saveLoginData(false);
                  log("Logout :- ${PreferenceManagerUtils.saveLoginData(false)}");
                  Get.to(const LoginScreen());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: ColorUtils.greyEC, width: 1)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      const WileToneImageWidget(
                        image: AppIconAssets.logout,
                        imageType: ImageType.png,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.settinglogout,
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                          WileToneTextWidget(
                            title: VariablesUtils.easilylogout,
                            fontSize: 12.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.grey5B,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
