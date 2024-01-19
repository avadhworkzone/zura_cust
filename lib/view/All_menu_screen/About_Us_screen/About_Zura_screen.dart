import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/all_menu_screen.dart';

class AboutZuraScreen extends StatefulWidget{
  const AboutZuraScreen({Key? key}) : super(key: key);

  @override
  State<AboutZuraScreen> createState() => _AboutZuraScreenState();
}

class _AboutZuraScreenState extends State<AboutZuraScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child : Padding(
          padding : EdgeInsets.symmetric(horizontal: 15.w),
          child : Column(
            children : [

              SizedBox(height: 20.h),
               WileToneAppBar(title: '',onPressed: () => const AllMenuScreen(),),
              SizedBox(height: 20.h),

              Align(
                 alignment : Alignment.centerLeft,
                child : WileToneTextWidget(
                  title : VariablesUtils.aboutzura,
                  fontSize : 20.sp,
                  fontFamily : AssetsUtils.poppins,
                  fontWeight : FontWeight.w600,
                  color : ColorUtils.black12,
                ),
              ),
              SizedBox(height : 10.h),

              WileToneTextWidget(
                title: VariablesUtils.conttentzura,
                fontSize: 12.sp,
                fontFamily: AssetsUtils.poppins,
                fontWeight: FontWeight.w400,
                color: ColorUtils.grey5B,
              ),

              SizedBox(height: MediaQuery.of(context).size.height/10.5),

              WileToneCustomButton(
                buttonRadius: 12.r,
                buttonColor: ColorUtils.black12,
                onPressed: () {
                  Get.back();
                },
                buttonName: VariablesUtils.gotit,
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