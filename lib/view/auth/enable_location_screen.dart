import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/search_area.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log(" Latitude= ${currentposition.latitude.toString()}");
      log("Longitude=${currentposition.longitude.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const WileToneAppBar(title: ''),
              SizedBox(
                height: 20.h,
              ),
              WileToneTextWidget(
                title: VariablesUtils.location,
                fontSize: 20.sp,
                fontFamily: AssetsUtils.poppins,
                fontWeight: FontWeight.w600,
                color: ColorUtils.black,
              ),
              SizedBox(
                height: 4.h,
              ),
              WileToneTextWidget(
                title: VariablesUtils.store,
                fontSize: 12.sp,
                fontFamily: AssetsUtils.poppins,
                fontWeight: FontWeight.w500,
                color: ColorUtils.greyShade1,
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.center,
                child: WileToneImageWidget(
                  color: ColorUtils.lightGreyA6,
                  image: AppIconAssets.locationIcon,
                  imageType: ImageType.png,
                  height: 73.h,
                  width: 63.w,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              WileToneCustomButton(
                onPressed: () {
                  getCurrentLocation();
                  Get.to(const SearchArea());
                },
                fontSize: 14.sp,
                buttonHeight: 52,
                buttonRadius: 12.sp,
                buttonColor: ColorUtils.greenColor,
                buttonName: VariablesUtils.devicelocation,
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.to(const SearchArea());
                  },
                  child: WileToneTextWidget(
                    title: VariablesUtils.manually,
                    fontSize: 14.sp,
                    fontFamily: AssetsUtils.poppins,
                    fontWeight: FontWeight.w500,
                    color: ColorUtils.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
