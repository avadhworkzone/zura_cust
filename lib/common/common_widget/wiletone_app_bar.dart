import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/common_back_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';

class  WileToneAppBar extends StatefulWidget{

  const WileToneAppBar({Key? key, this.onPressed, this.title}) : super(key: key);
  final VoidCallback? onPressed;
  final String? title;

  @override
  State<WileToneAppBar> createState() => _WileToneAppBarState();
}

class _WileToneAppBarState extends State<WileToneAppBar> {
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
          title: widget.title!,
          fontSize: 20,
          fontFamily: AssetsUtils.poppins,
          fontWeight: FontWeight.w600,
          color: ColorUtils.lightblack,
        ),
        const SizedBox(width: 40)
      ],
    );
  }
}
