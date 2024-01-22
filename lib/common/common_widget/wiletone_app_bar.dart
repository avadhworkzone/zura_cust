import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/common_back_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';

class  WileToneAppBar extends StatelessWidget{



  const WileToneAppBar({Key? key, this.onPressed, this.title,}) : super(key: key);
  final VoidCallback? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        CommonBackButton(
          onPressed :   () {

            log("============CLICK==================");
                Get.back();
              },
        ),
        WileToneTextWidget(
          title: title!,
          fontSize: 20.sp,
          fontFamily: AssetsUtils.poppins,
          fontWeight: FontWeight.w600,
          color: ColorUtils.lightblack,
        ),
         SizedBox(width: 40.w)
      ],
    );
  }
}
