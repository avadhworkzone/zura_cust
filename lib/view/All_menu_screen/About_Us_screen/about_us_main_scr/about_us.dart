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
import 'package:wilatone_restaurant/utils/variables_utils.dart';


import 'package:wilatone_restaurant/view/All_menu_screen/About_Us_screen/About_Zura_screen.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/About_Us_screen/Privacy_policy_screen.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/About_Us_screen/terms_of_service_scr.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/all_menu_screen.dart';


class AboutUsScreen extends StatefulWidget{
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>{

  @override
  Widget build(BuildContext context){

    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
               const WileToneAppBar(title: VariablesUtils.aboutus,),
              SizedBox(height: 20.h), 
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Column(
                    children: [

                      GestureDetector(
                        onTap: () {
                          if(index == 0){
                            log("++++++++++++++++$index++++++click==========================");
                                  Get.to(const AboutZuraScreen());
                          }
                          else if(index == 1){
                            log("++++++++++++++++$index++++++click==========================");
                            Get.to(const TermsofServices());
                          }
                          else if(index == 2){
                            log("++++++++++++++++$index++++++click==========================");
                            Get.to(const PrivacyPolicyScreen());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.grey, width: 1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: ListTile(
                            title: WileToneTextWidget(
                                title: VariablesUtils.aboutustitle[index]
                                    .toString(),
                                fontSize: 16.sp,
                                fontFamily: AssetsUtils.poppins,
                                fontWeight: FontWeight.w600,
                                color: ColorUtils.black),
                            subtitle: WileToneTextWidget(
                              title: VariablesUtils.aboutussubtitle[index]
                                  .toString(),
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.grey5B,
                            ),
                            trailing: const WileToneImageWidget(
                              image: AppIconAssets.sidearrow,
                              imageType: ImageType.png,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h), // Add space between containers

                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}