import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class TermsofServices extends StatefulWidget {
  const TermsofServices({Key? key}) : super(key: key);

  @override
  State<TermsofServices> createState() => _TermsofServicesState();
}

class _TermsofServicesState extends State<TermsofServices>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [

              SizedBox(height: 20.h),
              const WileToneAppBar(title: ''),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: WileToneTextWidget(
                  title: VariablesUtils.terrms,
                  fontSize: 20.sp,
                  fontFamily: AssetsUtils.poppins,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.black12,
                ),
              ),
              SizedBox(height: 20.h),

              WileToneTextWidget(
                title: "•${VariablesUtils.conttentterms}",
                fontSize: 12.sp,
                fontFamily: AssetsUtils.poppins,
                fontWeight: FontWeight.w400,
                color: ColorUtils.grey5B,
              ),
              // SizedBox(height: MediaQuery.of(context).size.height/10),

              WileToneCustomButton(
                buttonRadius: 12.r,
                buttonColor: ColorUtils.black12,
                onPressed: () {
                  Get.back();
                },
                buttonName: VariablesUtils.understood,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: AssetsUtils.poppins,
                fontColor: ColorUtils.white,

              ),
            ],
          ),
        ),
      ),
    );
  }
}