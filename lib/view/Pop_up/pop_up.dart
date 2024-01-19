import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/view/restaurant_detail_screen/restaurant_detail.dart';


enum SampleItem {
  itemOne,
  itemTwo,
}

SampleItem? selectedMenu;


class PopupMenu{

  PopupMenuButton popup(BuildContext context){

  return   PopupMenuButton(
      initialValue: selectedMenu,
      onSelected: (value) {
        print("Item :- $value");
        selectedMenu = value;
        print("selectedMenu :- $selectedMenu");


        // setState(() {
        //
        // });
      },

      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          padding: EdgeInsets.zero,
          height: 30,
          value: SampleItem.itemOne,
          child: InkWell(
            onTap : (){
              log("Move to RestaurantDetailScreen");
              Get.back();
              Get.to(const RestaurantDetailScreen());
            },
            child: SizedBox(
              // height: 20.h,
              width: 130.w,
              // color: Colors.red,
              child: const CustomPopupMenuItem(
                image: AppIconAssets.direction,
                title: 'Get Directions',
              ),
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: SampleItem.itemTwo,
          height: 20,

          child: InkWell(
            onTap : (){
              log("Move to RestaurantDetailScreen");
              Get.back();
              Get.to(const RestaurantDetailScreen());
            },
            child: SizedBox(
              // height: 20.h,
              width: 130.w,
              // color: Colors.red,
              child: const CustomPopupMenuItem(
                image: AppIconAssets.location,
                title: '5 Kms',
              ),
            ),
          ),
        ),
      ],
    );

  }

}

class CustomPopupMenuItem extends StatelessWidget{

  final String image;
  final String title;

  const CustomPopupMenuItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context){

    return Row(
      children: [
        SizedBox(
          width: 10.w,
        ),
        WileToneImageWidget(
          image: image,
          imageType: ImageType.png,
        ),
        SizedBox(
          width: 10.w,
        ),
        WileToneTextWidget(
          title: title,
          fontSize: 12.sp,
          fontFamily: AssetsUtils.inter,
          fontWeight: FontWeight.w500,
          color: ColorUtils.black,
        ),
      ],
    );
  }
}
