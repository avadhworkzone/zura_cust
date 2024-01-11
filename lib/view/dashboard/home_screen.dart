import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  RxList imagename = [
     'Restaurant',
     'Cafe',
     'Sweet Shop',
     'Salon',
     'Stationery',
     'Pharmacy',
     'Fitness',
     'Fashion',
  ].obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              /// Top App bar
              Container(
                width: double.infinity.w,
                height: 102.h,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFCFAEF),
                        Color(0xFFE8FFDF)
                      ], // Change colors as needed

                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // stops: [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.sp),
                        bottomRight: Radius.circular(30.sp))),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),

                      /// person icon
                      WileToneImageWidget(
                        // color: ColorUtils.lightGreyA6,
                        image: AppIconAssets.personicon,
                        imageType: ImageType.png,
                        height: 38.h,
                        width: 38.w,
                      ),

                      SizedBox(
                        width: 15.w,
                      ),

                      /// Ruppes value
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.saved,
                            fontSize: 10.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.black,
                          ),
                          WileToneTextWidget(
                            title: VariablesUtils.ruppes,
                            fontSize: 24.sp,
                            fontFamily: AssetsUtils.metrophobic,
                            fontWeight: FontWeight.w700,
                            color: ColorUtils.black,
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 70.w,
                      ),

                      /// reward icon
                      Container(
                        width: 113.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: ColorUtils.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(38.sp),
                                bottomLeft: Radius.circular(38.sp),
                                bottomRight: Radius.circular(38.sp),
                                topRight: Radius.circular(38.sp))),
                        child: Row(
                          children: [
                            WileToneImageWidget(
                              image: AppIconAssets.reward,
                              imageType: ImageType.png,
                              height: 38.h,
                              width: 38.w,
                            ),

                            WileToneTextWidget(
                              title: VariablesUtils.reward,
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              WileToneTextFormField(
                pIcon: WileToneImageWidget(
                  color: ColorUtils.lightGreyA6,
                  image: AppIconAssets.searchoicon,
                  imageType: ImageType.png,
                  height: 24.h,
                  width: 24.w,
                ),
                filled: false,
                height: 52.h,
                borderSide: const BorderSide(color: ColorUtils.lightGreyD7),
                borderRadius: 57.sp,
                hintText: VariablesUtils.searchstores,
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: ColorUtils.lightGreyA6,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: WileToneTextWidget(
                  title: VariablesUtils.shop,
                  fontSize: 16.sp,
                  fontFamily: AssetsUtils.poppins,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.black,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),


              GridView.builder(
                shrinkWrap: true,
                itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder : (context, index) {
                    return ListTile(

                     title : WileToneImageWidget(
                        image: AppIconAssets.reward,
                        imageType: ImageType.png,
                        height: 38.h,
                        width: 38.w,
                      ),
                      subtitle :  WileToneTextWidget(
                        title: imagename[index].toString(),
                        fontSize: 12.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.black,
                      ),

                    );
                  },),
            ],
          ),
        ),
      ),
    );
  }
}
