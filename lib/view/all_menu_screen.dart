import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class AllMenuScreen extends StatefulWidget {
  const AllMenuScreen({Key? key}) : super(key: key);

  @override
  State<AllMenuScreen> createState() => _AllMenuScreenState();
}

class _AllMenuScreenState extends State<AllMenuScreen> {
  @override
  Widget build(BuildContext context) {
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

              WileToneTextWidget(
                title: VariablesUtils.personname,
                fontSize: 24.sp,
                fontFamily: AssetsUtils.poppins,
                fontWeight: FontWeight.w700,
                color: ColorUtils.black,
              ),

              WileToneTextWidget(
                title: VariablesUtils.number,
                fontSize: 16.sp,
                fontFamily: AssetsUtils.poppins,
                fontWeight: FontWeight.w500,
                color: ColorUtils.black,
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

                  return Container(
                    // height: 50.h, // Adjust this value as needed
                    // width: MediaQuery.of(context).size.width / 2.5,
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
                            image: AppIconAssets.personIcon[index]
                                .toString(),
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