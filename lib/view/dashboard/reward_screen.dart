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

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            SizedBox(
              height: 20.h,
            ),
            const WileToneAppBar(title: VariablesUtils.rewardtext),
            SizedBox(
              height: 20.h,
            ),
             Stack(
alignment: Alignment.center,
              children: [

                const WileToneImageWidget(
                  image: AppIconAssets.ruppeicon,
                  imageType: ImageType.png,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WileToneTextWidget(
                      title:  VariablesUtils.savedtext,
                      fontSize: 16.sp,
                      fontFamily: AssetsUtils.poppins,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.lightblack,
                    ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    WileToneTextWidget(
                      title:  '0 0 0 0',
                      fontSize: 48.sp,
                      fontFamily: AssetsUtils.metrophobic,
                      fontWeight: FontWeight.w700,
                      color: ColorUtils.black,
                    ),
                  ],
                )

              ]
            ),

            SizedBox(
              height: 20.h,
            ),

            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index){
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      WileToneImageWidget(
                        image: AppIconAssets.coinicon[index].toString(),
                        imageType: ImageType.png,
                      ),

                      SizedBox(
                        width: 15.w,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          WileToneTextWidget(
                            title:
                                VariablesUtils.sheetalhotel[index].toString(),
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.inter,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.lightblack,
                          ),
                          WileToneTextWidget(
                            title: VariablesUtils.datetime[index].toString(),
                            fontSize: 12.sp,
                            fontFamily: AssetsUtils.inter,
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.lightGreyA6,
                          ),


                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.5,
                      ),
                      WileToneTextWidget(
                        title: VariablesUtils.ruppestext[index].toString(),
                        fontSize: 16.sp,
                        fontFamily: AssetsUtils.inter,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black,
                      ),
                    ]);
              },

              separatorBuilder: (BuildContext context, int index) => const Divider(

                // height: 2.h,
                thickness: 1,
                indent: 50,
                endIndent: 30,
                color: ColorUtils.greyD9,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 1.8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: WileToneCustomButton(
                onPressed: () {},
                buttonName: 'Save More',
              ),
            ),

          ],
        ),
      ),
    );
  }
}