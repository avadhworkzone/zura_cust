import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/restaurantDetailScreen/restaurant_detail.dart';
import '../../common/common_widget/wiletone_text_widget.dart';
import '../../utils/app_icon_assets.dart';
import '../../utils/assets/assets_utils.dart';

class PaymentSuccessScreen extends StatefulWidget{
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppIconAssets.payment))
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.h,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Container(
                    height: Get.height/3.8,
                    width: Get.width/1.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorUtils.white
                    ),
                    child: Column(children: [
                      SizedBox(height: 15.h,),
                      Card(
                        shape: const CircleBorder(side: BorderSide(color: ColorUtils.greyAC)),
                        child: CircleAvatar(
                          backgroundColor: ColorUtils.white,
                          radius: 30.r,
                          child: Center(child: SvgPicture.asset(AppIconAssets.moneyIcon,height: 22),),),
                      ),
                      SizedBox(height: 10.h,),
                      WileToneTextWidget(
                        title: VariablesUtils.youSaved,
                        fontSize: 20.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.black,
                      ),
                      SizedBox(height: 10.h,),
                      WileToneTextWidget(
                        title: "\₹50",
                        fontSize: 23.sp,
                        fontFamily: AssetsUtils.inter,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.black,
                      ),
                      SizedBox(height: 20.h,),
                      WileToneTextWidget(
                        title: "20%${VariablesUtils.off2}",
                        fontSize: 12.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.lightGreyA6,
                      ),
                    ],),
                  ),
                ),
                SizedBox(height: 20.h,),
                ///Done Button
                InkWell(
                  onTap: (){
                    Get.to(const RestaurantDetailScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: Get.height*0.06,
                    width: Get.width/5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorUtils.lightGreyA6),
                      color: Colors.white
                    ),
                    child:  WileToneTextWidget(
                      title: VariablesUtils.done,
                      fontSize: 14.sp,
                      fontFamily: AssetsUtils.poppins,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black,
                    ),
                  ),
                ),

              ],
            ),
          ),
        )
      ],)
    );
  }
}
