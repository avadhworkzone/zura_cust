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

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              const WileToneAppBar(title: VariablesUtils.myorder),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                        title: WileToneTextWidget(
                          title: VariablesUtils.hotelName,
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.inter,
                          fontWeight: FontWeight.w700,
                          color: ColorUtils.black,
                        ),
                        subtitle: WileToneTextWidget(
                          title: VariablesUtils.hotelAddress,
                          fontSize: 12.sp,
                          fontFamily: AssetsUtils.inter,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.grey5B,
                        ),
                        trailing: WileToneTextWidget(
                          title: VariablesUtils.amount,
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.inter,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      Container(
                        height: 72.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                                color: ColorUtils.lightGreyD7, width: 1)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            const WileToneImageWidget(
                              image: AppIconAssets.coin,
                              imageType: ImageType.png,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            WileToneTextWidget(
                              title: VariablesUtils.orderdiscount,
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black12,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                            ),
                            WileToneTextWidget(
                              title: '₹50',
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.inter,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: WileToneTextWidget(
                          title: '12 Nov 2023 at 2:00PM',
                          fontSize: 12.sp,
                          fontFamily: AssetsUtils.inter,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.grey5B,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
