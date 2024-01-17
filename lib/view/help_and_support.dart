import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';


class HelpandSupport extends StatefulWidget{
  const HelpandSupport({Key? key}) : super(key: key);

  @override
  State<HelpandSupport> createState() => _HelpandSupportState();
}

class _HelpandSupportState extends State<HelpandSupport> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Expanded(
                child : Column(
                  children : [

                    SizedBox(height: 20.h),
                    const WileToneAppBar(title: VariablesUtils.help),
                    SizedBox(height: 20.h),
                    ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                log("++++++++++++++++++++++click==========================");
                                setState(() {
                                  isvisible = !isvisible;
                                });
                              }
                            },
                            child: Container(
                              // height: index ==  2 ? 60.h : 42.h,
                              // height: isvisible == true && index == 0 ? 42.h : ,
                              decoration: isvisible == true && index == 0
                                  ? BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(8.r),
                                      // border: Border.all(width: 0.w, color: ColorUtils.greyEC)
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          width: 1.w, color: ColorUtils.greyEC)),
                              padding :  EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              child : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children : [

                                  Row(
                                    children: [

                                      WileToneTextWidget(
                                        title: VariablesUtils.helpandsupport[index].toString(),
                                        fontSize: 12.sp,
                                        fontFamily: AssetsUtils.poppins,
                                        fontWeight: FontWeight.w600,
                                        color: ColorUtils.black,
                                      ),

                                      const Spacer(),

                                      WileToneImageWidget(
                                        image: index == 0
                                            ? isvisible == true
                                                ? AppIconAssets.uparrow
                                                : AppIconAssets.belowarrow
                                            : AppIconAssets.belowarrow,
                                        imageType: ImageType.png,
                                        scale: 1,
                                      ),
                                    ],
                                  ),

                                  if(isvisible == true && index == 0)
                                    WileToneTextWidget(
                                      title: VariablesUtils.content,
                                      fontSize: 11.sp,
                                      fontFamily: AssetsUtils.poppins,
                                      fontWeight: FontWeight.w400,
                                      color: ColorUtils.black,
                                    ),
                                ],
                              ),


                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),

              /// Contact Us Button
              WileToneCustomButton(
                buttonRadius: 16.r,
                buttonColor: ColorUtils.black12,
                onPressed: () {},
                buttonName: VariablesUtils.contactUs,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: AssetsUtils.poppins,
                fontColor: ColorUtils.white,
              ),

              SizedBox(height: 15.h)
            ],
          ),
        ),
      ),
    );
  }
}
