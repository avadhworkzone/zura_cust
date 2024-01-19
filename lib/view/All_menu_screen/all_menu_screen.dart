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
import 'package:wilatone_restaurant/view/All_menu_screen/About_Us_screen/about_us_main_scr/about_us.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/My_order_screen/my_order.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/Profile_details/profile_detail_screen.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/setting_screen/setting_screen.dart';
import 'package:wilatone_restaurant/view/dashboard/reward_screen.dart';
import 'package:wilatone_restaurant/view/All_menu_screen/Help_and_support/help_and_support.dart';

class AllMenuScreen extends StatefulWidget {
  const AllMenuScreen({Key? key}) : super(key: key);

  @override
  State<AllMenuScreen> createState() => _AllMenuScreenState();
}

class _AllMenuScreenState extends State<AllMenuScreen> {

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const WileToneAppBar(title: ''),

              SizedBox(
                height: 20.h,
              ),

              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: WileToneTextWidget(
                  title: VariablesUtils.personname,
                  fontSize: 24.sp,
                  fontFamily: AssetsUtils.poppins,
                  fontWeight: FontWeight.w700,
                  color: ColorUtils.black,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: WileToneTextWidget(
                  title: VariablesUtils.number,
                  fontSize: 16.sp,
                  fontFamily: AssetsUtils.poppins,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black,
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              GridView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 10.w),

                itemCount: 6,
                shrinkWrap: true,
                gridDelegate : const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
               physics: const NeverScrollableScrollPhysics(),
                itemBuilder : (context, index){

                  return InkWell(
                    onTap: (){
                      if(VariablesUtils.menuname[index] == 'Profile Details'){
                         Get.to(const ProfileDetailScreen());
                      }
                      else if(VariablesUtils.menuname[index] == 'My Rewards'){
                        Get.to(const RewardScreen());
                      }
                      else if(VariablesUtils.menuname[index] == 'My Orders'){
                         Get.to(const MyOrders());
                      }
                      else if(VariablesUtils.menuname[index] == 'About Us'){
                        Get.to(const AboutUsScreen());
                      }
                      else if(VariablesUtils.menuname[index] == 'Help & Support'){
                        Get.to(const HelpandSupport());
                      }
                      else if(VariablesUtils.menuname[index] == 'Settings'){
                        Get.to(const SettingScreen());
                      }
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r,),
                        border: Border.all(color:  ColorUtils.grey,width: 1),
                        color: const Color(0xffF8F8F8),
                      ),
                      child: Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            WileToneImageWidget(
                              image: AppIconAssets.personIcon[index].toString(),
                              imageType: ImageType.png,
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            WileToneTextWidget(
                              title: VariablesUtils.menuname[index].toString(),
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),SizedBox(
                height: MediaQuery.of(context).size.height/4.4,
              ),
               Row(
                 // crossAxisAlignment: CrossAxisAlignment.en,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WileToneImageWidget(
                    image: AppIconAssets.linkedicon,
                    imageType: ImageType.png,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width.w/5.4,
                  ),
                  const WileToneImageWidget(
                    image: AppIconAssets.instagramicon,
                    imageType: ImageType.png,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.en,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WileToneTextWidget(
                    title: VariablesUtils.madeinindia,
                    fontSize: 10.sp,
                    fontFamily: AssetsUtils.poppins,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.black,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const WileToneImageWidget(
                    image: AppIconAssets.hearticon,
                    imageType: ImageType.png,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}