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

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                     SizedBox(height: 20.h),
                    const WileToneAppBar(title: VariablesUtils.profileDetails),
                     SizedBox(height: 20.h),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                       return  ListTile(
                         title: WileToneTextWidget(
                           title: VariablesUtils.profiletitle[index].toString(),
                           fontSize: 12.sp,
                           fontFamily: AssetsUtils.poppins,
                           fontWeight: FontWeight.w500,
                           color: ColorUtils.grey5B,
                         ),
                         subtitle: WileToneTextWidget(
                           title: VariablesUtils.profilename[index].toString(),
                           fontSize: 16.sp,
                           fontFamily: AssetsUtils.poppins,
                           fontWeight: FontWeight.w600,
                           color: ColorUtils.black,
                         ),
                         trailing: const WileToneImageWidget(
                           image: AppIconAssets.pencilicon,
                           imageType: ImageType.png,
                         ),
                       );
                    },)

                  ],
                ),
              ),


              WileToneCustomButton(
                buttonRadius: 12.r,
                buttonColor: ColorUtils.black12,
                onPressed: () {},
                buttonName: VariablesUtils.update,
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
