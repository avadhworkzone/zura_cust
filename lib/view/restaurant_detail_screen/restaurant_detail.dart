import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/dashboard/bottombar_screen.dart';
import 'package:wilatone_restaurant/view/restaurant_detail_screen/restaurant_gallery_screen.dart';
import '../../common/common_widget/wiletone_image_widget.dart';
import '../../utils/enum_utils.dart';
import '../payment/payment_success_screen.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({super.key});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  Rx<TextEditingController> amountcontroller = TextEditingController().obs;
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    ///First Half
                    InkWell(
                      onTap: () {
                        Get.to(() => const RestaurantGalleryScreen());
                      },
                      child: Container(
                        height: Get.height / 3.h,
                        width: Get.width.w,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppIconAssets.frame4),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),

                              ///Back Arrow and share

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
                                child: Row(
                                  children: [
                                    /// Back Button
                                    InkWell(
                                      onTap: (){
                                         Get.back();
                                      },
                                      child: CircleAvatar(radius: 18.r,backgroundColor: ColorUtils.white,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                            child: Icon(Icons.arrow_back_ios,size: 18.h,)),),
                                    ),
                                    const Spacer(),
                                    CircleAvatar(radius: 18.r,backgroundColor: ColorUtils.white,child: Center(child: Image.asset(AppIconAssets.shareIcon)),),
                                  ],
                                ),
                              ),


                              const Spacer(),

                              ///Gallery

                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.h, bottom: 15.h),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: Get.height * 0.04.h,
                                      width: Get.width / 4.6.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [

                                          const WileToneImageWidget(
                                            image: AppIconAssets.gallery,
                                            imageType: ImageType.png,
                                            // height: 70.h,
                                            // width: 70.w,
                                          ),
                                          SizedBox(
                                            width: 4.h,
                                          ),
                                          WileToneTextWidget(
                                            title: VariablesUtils.gallery,
                                            fontSize: 13.h,
                                            color: ColorUtils.white,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///Second Half
                    SizedBox(
                      height: 62.h,
                    ),
                    WileToneTextWidget(
                      title: 'Sheetal Hotel',
                      fontFamily: AssetsUtils.inter,
                      fontSize: 32.sp,
                      color: ColorUtils.black,
                      fontWeight: FontWeight.w700,
                    ),
                    WileToneTextWidget(
                      title: 'Rohan corner, Bibwewadi',
                      fontFamily: AssetsUtils.inter,
                      fontSize: 12.sp,
                      color: ColorUtils.grey5B,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///Paybill, Offers, and About
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorColor: ColorUtils.lightblack,
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: ColorUtils.grey5B,
                          labelColor: ColorUtils.lightblack,
                          labelStyle: TextStyle(
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                          unselectedLabelStyle: TextStyle(
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                          tabs: const [
                            Tab(
                              text: VariablesUtils.paybill,
                            ),
                            Tab(
                              text: VariablesUtils.offers,
                            ),
                            Tab(
                              text: VariablesUtils.about,
                            ),
                          ]),
                    ),

                    SizedBox(
                        // color: Colors.blue,
                        height: Get.height / 2.h,
                        child: TabBarView(children: [
                          ///PayBill View
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 22.h,
                                ),

                                ///Amount Field
                                Row(
                                  children: [
                                    WileToneTextWidget(
                                      title: VariablesUtils.billAmount,
                                      fontFamily: AssetsUtils.poppins,
                                      fontSize: 14.sp,
                                      color: ColorUtils.lightblack,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      width: Get.width / 10.w,
                                    ),
                                    Expanded(
                                        child: WileToneTextFormField(
                                            isValidate: true,
                                            textInputType: TextInputType.number,
                                            hintText:
                                                VariablesUtils.enterAmount,
                                            borderSide: const BorderSide(
                                                color: ColorUtils.lightGreyA6),
                                            controller: amountcontroller.value))
                                  ],
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),

                                ///Discount Field
                                Container(
                                  height: Get.height / 14.h,
                                  width: Get.width.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border:
                                          Border.all(color: ColorUtils.green)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        WileToneTextWidget(
                                          title: VariablesUtils.discount,
                                          fontFamily: AssetsUtils.poppins,
                                          fontSize: 13.sp,
                                          color: ColorUtils.lightblack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Container(
                                          height: 18.h,
                                          width: Get.width * 0.1.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: ColorUtils.red),
                                          child: WileToneTextWidget(
                                            title: '10\%',
                                            fontFamily: AssetsUtils.poppins,
                                            fontSize: 10.sp,
                                            color: ColorUtils.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        Radio(
                                            activeColor: ColorUtils.green,
                                            value: 1,
                                            groupValue: selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedOption = value;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),

                                ///Coupon Field
                                Container(
                                  height: Get.height / 14.h,
                                  width: Get.width.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: ColorUtils.lightGreyD3)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            AppIconAssets.discountIcons),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        WileToneTextWidget(
                                          title: VariablesUtils.magicCoupon,
                                          fontFamily: AssetsUtils.poppins,
                                          fontSize: 13.sp,
                                          color: ColorUtils.lightblack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        WileToneTextWidget(
                                          title:
                                              "(${VariablesUtils.extra} 1\% ${VariablesUtils.off2})",
                                          fontFamily: AssetsUtils.poppins,
                                          fontSize: 13.sp,
                                          color: ColorUtils.lightblack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const Spacer(),
                                        Radio(
                                            activeColor: ColorUtils.green,
                                            value: 2,
                                            groupValue: selectedOption,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedOption = value;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                ),

                                ///Pay Button
                                WileToneCustomButton(
                                  buttonHeight: 52.h,
                                  buttonWidth: Get.width,
                                  buttonRadius: 25.r,
                                  buttonColor: ColorUtils.green,
                                  onPressed: () {
                                    _showAmountData(context);
                                  },
                                  buttonName: VariablesUtils.pay,
                                  fontSize: 16.sp,
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                          const Center(child: Text("View 2")),
                          const Center(child: Text("View 3")),
                        ]))
                  ],
                ),
              ),
              Positioned(
                top: 220.h,
                left: 170.h,
                child: const WileToneImageWidget(
                  image: AppIconAssets.frame2,
                  imageType: ImageType.png,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAmountData(BuildContext context) {
    showModalBottomSheet<void>(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            width: Get.width.w,
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

                      ///Summary
                      WileToneTextWidget(
                        title: VariablesUtils.summary,
                        fontSize: 14.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(
                        color: ColorUtils.lightGreyA6,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      ///Bill Amount
                      Row(
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.billAmount,
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.metrophobic,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                          const Spacer(),
                          WileToneTextWidget(
                            title: '\₹1,000',
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.metrophobic,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      ///Discount
                      Row(
                        children: [
                          WileToneTextWidget(
                            title: "${VariablesUtils.discount}(10\%)",
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.green,
                          ),
                          const Spacer(),
                          WileToneTextWidget(
                            title: '-\₹100',
                            fontSize: 16.sp,
                            fontFamily: AssetsUtils.metrophobic,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.green,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(
                        color: ColorUtils.lightGreyA6,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      ///Total Amount
                      Row(
                        children: [

                          WileToneTextWidget(
                            title: VariablesUtils.payOnly,
                            fontSize: 15.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),

                          const Spacer(),

                          WileToneTextWidget(
                            title: '\₹900',
                            fontSize: 15.sp,
                            fontFamily: AssetsUtils.poppins,
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.black,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: Get.height / 6.h,
                      ),

                      ///Pay Button
                      WileToneCustomButton(
                        buttonHeight: 52.h,
                        buttonWidth: Get.width.w,
                        buttonRadius: 25.sp,
                        buttonColor: ColorUtils.green,
                        onPressed: () {
                          Get.to(() => const PaymentSuccessScreen());
                        },
                        buttonName: "${VariablesUtils.pay}\₹900",
                        fontSize: 16,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
