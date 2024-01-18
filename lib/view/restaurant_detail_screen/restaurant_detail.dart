import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
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

  Rx<TextEditingController> Amountcontroller = TextEditingController().obs;
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
                    Container(
                      height: Get.height/3,
                      width: Get.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppIconAssets.frame4),fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.h,),
                          ///Back Arrow and share
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.h),
                            child: Row(
                              children: [
                                CircleAvatar(radius: 20.h,backgroundColor: ColorUtils.white,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.h),
                                      child: Icon(Icons.arrow_back_ios,size: 20.h,)),),
                                Spacer(),
                                CircleAvatar(radius: 20.h,backgroundColor: ColorUtils.white,child: Center(child: Image.asset(AppIconAssets.shareIcon)),),
                              ],
                            ),
                          ),
                          Spacer(),
                          ///Gallery
                          InkWell(
                            onTap: (){
                              Get.to(()=> RestaurantGalleryScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.h,bottom: 15.h),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: Get.height*0.04,
                                  width: Get.width/4.6,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Icon(Icons.photo,size: 25.h,),
                                    SizedBox(width: 4.h,),
                                    WileToneTextWidget(title: VariablesUtils.gallery,fontSize: 15.h,)
                                  ],),
                                ),
                              ),
                            ),
                          ),
        
                        ],
                      ),
                    ),
        
                    ///Second Half
                    SizedBox(height: 62.h,),
                    WileToneTextWidget(
                      title: 'Sheetal Hotel',
                      fontFamily: AssetsUtils.inter,
                      fontSize: 22,
                      color: ColorUtils.black,
                      fontWeight: FontWeight.w700,
                    ),
                    WileToneTextWidget(
                      title: 'Rohan corner, Bibwewadi',
                      fontFamily: AssetsUtils.inter,
                      fontSize: 9,
                      color: ColorUtils.grey5B,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 20,),
        
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
                            fontSize: 14
                          ),
                          unselectedLabelStyle: TextStyle(
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),
        
                          tabs: [
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
        
                    Container(
                      // color: Colors.blue,
                      height: Get.height/2,
                        child: TabBarView(children: [
                        ///PayBill View
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Column(children: [
                          SizedBox(height: 22,),

                          ///Amount Field
                          Row(children: [
                            WileToneTextWidget(

                              title: VariablesUtils.billAmount,
                              fontFamily: AssetsUtils.poppins,
                              fontSize: 14,
                              color: ColorUtils.lightblack,
                              fontWeight: FontWeight.w500,
                                    ),
                            SizedBox(width: Get.width/10,),
                            Expanded(child: WileToneTextFormField(

                              isValidate: true,
                                textInputType: TextInputType.number,
                                hintText: VariablesUtils.enterAmount,
                                borderSide: BorderSide(color: ColorUtils.lightGreyA6), controller: Amountcontroller.value))
                          ],),

                         SizedBox(height: 20,),

                         ///Discount Field
                         Container(
                           height: Get.height/14,
                           width: Get.width,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(color: ColorUtils.green)
                           ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(children: [
                              WileToneTextWidget(

                                title: VariablesUtils.discount,
                                fontFamily: AssetsUtils.poppins,
                                fontSize: 13,
                                color: ColorUtils.lightblack,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(width: 6,),
                              Container(
                                height: 18,
                                width: Get.width*0.1,
                                  alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorUtils.red
                                ),
                                child: WileToneTextWidget(

                                  title: '10\%',
                                  fontFamily: AssetsUtils.poppins,
                                  fontSize: 10,
                                  color: ColorUtils.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                             Spacer(),
                              Radio(
                                  activeColor: ColorUtils.green,
                                  value: 1, groupValue: selectedOption, onChanged: (value){
                                setState(() {
                                  selectedOption = value;
                                });
                              }),
                            ],),
                          ),
                         ),
                          SizedBox(height: 12,),

                          ///Coupon Field
                          Container(
                            height: Get.height/14,
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: ColorUtils.lightGreyD3)
                            ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [

                              SvgPicture.asset(AppIconAssets.discountIcons),
                              SizedBox(width: 12,),
                              WileToneTextWidget(

                              title: VariablesUtils.magicCoupon,
                                fontFamily: AssetsUtils.poppins,
                                fontSize: 13,
                                color: ColorUtils.lightblack,
                                fontWeight: FontWeight.w600,
                            ),
                                WileToneTextWidget(

                                  title: "(${VariablesUtils.extra} 1\% ${VariablesUtils.off2})",
                                  fontFamily: AssetsUtils.poppins,
                                  fontSize: 13,
                                  color: ColorUtils.lightblack,
                                  fontWeight: FontWeight.w600,
                                ),
                                Spacer(),
                                Radio(
                                    activeColor: ColorUtils.green,
                                    value: 2, groupValue: selectedOption, onChanged: (value){
                                  setState(() {
                                    selectedOption = value;
                                  });
                                }),
                              ],
                            ),
                          ),
                          ),
                         SizedBox(height: Get.height/8,),
                          ///Pay Button
                          WileToneCustomButton(
                              buttonHeight: Get.height/14,
                              buttonWidth: Get.width,
                              buttonRadius: 25,
                              buttonColor: ColorUtils.green,
                              onPressed: (){
                                _showAmountData(context);
                              },
                              buttonName: VariablesUtils.pay,fontSize: 16,),

                          SizedBox(height: 10,),
                        ],),
                      ),
                      Center(child: Text("View 2")),
                      Center(child: Text("View 3")),
                    ]))
        
        
                  ],
                ),
              ),
              Positioned(
                top: 220.h,
                left: 170.h,
                child: WileToneImageWidget(
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            width: Get.width,
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 16,),
                      ///Summary
                      WileToneTextWidget(
                        title: VariablesUtils.summary,
                        fontSize: 16.sp,
                        fontFamily: AssetsUtils.poppins,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.black,
                      ),
                      SizedBox(height: 10,),
                      Divider(color: ColorUtils.lightGreyA6,),
                      SizedBox(height: 10,),

                      ///Bill Amount
                      Row(children: [
                        WileToneTextWidget(
                          title: VariablesUtils.billAmount,
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.metrophobic,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                        Spacer(),
                        WileToneTextWidget(
                          title: '\₹1,000',
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.metrophobic,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                      ],),
                      SizedBox(height: 10,),

                      ///Discount
                      Row(children: [
                        WileToneTextWidget(
                          title: "${VariablesUtils.discount}(10\%)",
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.poppins,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.green,
                        ),
                        Spacer(),
                        WileToneTextWidget(
                          title: '-\₹100',
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.metrophobic,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.green,
                        ),
                      ],),
                      SizedBox(height: 10,),
                      Divider(color: ColorUtils.lightGreyA6,),
                      SizedBox(height: 10,),

                      ///Total Amount
                      Row(children: [
                        WileToneTextWidget(
                          title: VariablesUtils.payOnly,
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.metrophobic,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                        Spacer(),
                        WileToneTextWidget(
                          title: '\₹900',
                          fontSize: 16.sp,
                          fontFamily: AssetsUtils.metrophobic,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.black,
                        ),
                      ],),
                     SizedBox(height: Get.height/6,),
                      ///Pay Button
                      WileToneCustomButton(
                        buttonHeight: Get.height/14,
                        buttonWidth: Get.width,
                        buttonRadius: 25,
                        buttonColor: ColorUtils.green,
                        onPressed: (){
                          Get.to(()=> PaymentSuccessScreen());
                        },
                        buttonName:"${VariablesUtils.pay}\₹900",fontSize: 16,),
                      SizedBox(height: 15,),

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

