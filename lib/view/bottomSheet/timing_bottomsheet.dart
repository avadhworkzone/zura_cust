import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class TimingBottomSheet{

  String? RestaurantTime;

  void showTimingData(BuildContext context) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 16.h,
                        ),
                        WileToneTextWidget(
                          title: VariablesUtils.timing,
                          fontSize: 18.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            WileToneTextWidget(
                              title: VariablesUtils.all,
                              fontSize: 18.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black,
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 16.h),
                              child: Icon(
                                Icons.radio_button_checked,
                                color: ColorUtils.green,
                                size: 30.h,
                              ),
                            ),
                          ],
                        ),

                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 15.h),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: VariablesUtils.restaurantTime.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  WileToneTextWidget(
                                      title:
                                      VariablesUtils.restaurantTime[index]),
                                  const Spacer(),
                                  Radio(
                                      activeColor: ColorUtils.green,
                                      toggleable: true,
                                      value:
                                      VariablesUtils.restaurantTime.length,
                                      groupValue: RestaurantTime,
                                      onChanged: (value) {
                                          RestaurantTime = value.toString();
                                        // setState(() {
                                        // });
                                      })
                                ],
                              );
                            }),
                        // SizedBox(height: 10.h,),

                        ///Buttons
                        Row(
                          children: [
                            WileToneCustomButton(
                              buttonHeight: Get.height * 0.06,
                              buttonWidth: Get.width / 2.2,
                              buttonColor: ColorUtils.white,
                              onPressed: () {},
                              buttonName: VariablesUtils.clearAll,
                              fontColor: ColorUtils.green,
                            ),
                            WileToneCustomButton(
                              buttonHeight: Get.height * 0.06,
                              buttonWidth: Get.width / 2.2,
                              buttonColor: ColorUtils.green,
                              onPressed: () {},
                              buttonName: VariablesUtils.ApplyBtn,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}