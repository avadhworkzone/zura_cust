import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/home_page_res_model.dart';
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/view/Popup/pop_up.dart';
import 'package:wilatone_restaurant/view/allMenuScreen/all_menu_screen.dart';
import 'package:wilatone_restaurant/view/bottomSheet/sort_bottomsheet.dart';
import 'package:wilatone_restaurant/view/bottomSheet/timing_bottomsheet.dart';
import 'package:wilatone_restaurant/view/restaurantDetailScreen/restaurant_detail.dart';
import 'package:wilatone_restaurant/viewModel/auth_view_model.dart';
import 'package:wilatone_restaurant/viewModel/home_view_model.dart';
import '../../common/common_widget/wiletone_image_widget.dart';
import '../../common/common_widget/wiletone_text_form_field.dart';
import '../../common/common_widget/wiletone_text_widget.dart';
import '../../utils/app_icon_assets.dart';
import '../../utils/assets/assets_utils.dart';
import '../../utils/color_utils.dart';
import '../../utils/enum_utils.dart';
import '../../utils/variables_utils.dart';
import '../dashboard/all_brands.dart';
import '../dashboard/reward_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxInt current = 0.obs;
  static Rx<TextEditingController> searchstores = TextEditingController().obs;
  final HomeViewModel homeViewModel = Get.find<HomeViewModel>();

  final _controller = CarouselController().obs;
  Sortbottomsheet sortsheet = Sortbottomsheet();
  TimingBottomSheet timesheet = TimingBottomSheet();
  PopupMenu popup = PopupMenu();

  static List imagename = [
    'Restaurant',
    'Cafe',
    'Sweet Shop',
    'Salon',
    'Stationery',
    'Pharmacy',
    'Fitness',
    'Fashion',
  ];

  // ignore: non_constant_identifier_names
  String? RestaurantTime;

  @override
  void initState() {
    homeViewModel.categoryList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in AppIconAssets.listviewimages) {
        precacheImage(AssetImage(imageUrl), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 190.h,
              width: Get.width.w,
              child: Column(
                children: [
                  /// Top App bar
                  Container(
                    width: double.infinity.w,
                    height: 102.h,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFCFAEF),
                            Color(0xFFE8FFDF)
                          ], // Change colors as needed

                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.sp),
                            bottomRight: Radius.circular(30.sp))),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),

                          /// person icon
                          InkWell(
                            onTap: () {
                              Get.to(const AllMenuScreen());
                            },
                            child: WileToneImageWidget(
                              // color: ColorUtils.lightGreyA6,
                              image: AppIconAssets.personicon,
                              imageType: ImageType.png,
                              height: 38.h,
                              width: 38.w,
                            ),
                          ),

                          SizedBox(
                            width: 15.w,
                          ),

                          /// Ruppes value
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              WileToneTextWidget(
                                title: VariablesUtils.saved,
                                fontSize: 10.sp,
                                fontFamily: AssetsUtils.poppins,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.black,
                              ),
                              WileToneTextWidget(
                                title: VariablesUtils.ruppes,
                                fontSize: 24.sp,
                                fontFamily: AssetsUtils.metrophobic,
                                fontWeight: FontWeight.w700,
                                color: ColorUtils.black,
                              ),
                            ],
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width.w / 5,
                          ),

                          /// reward icon
                          InkWell(
                            onTap: () {
                              Get.to(const RewardScreen());
                            },
                            child: Container(
                              width: 113.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(38.sp),
                                      bottomLeft: Radius.circular(38.sp),
                                      bottomRight: Radius.circular(38.sp),
                                      topRight: Radius.circular(38.sp))),
                              child: Row(
                                children: [
                                  WileToneImageWidget(
                                    image: AppIconAssets.reward,
                                    imageType: ImageType.png,
                                    height: 38.h,
                                    width: 38.w,
                                  ),
                                  WileToneTextWidget(
                                    title: VariablesUtils.reward,
                                    fontSize: 12.sp,
                                    fontFamily: AssetsUtils.poppins,
                                    fontWeight: FontWeight.w500,
                                    color: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  /// Textfield search Stores
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.sp),
                    child: InkWell(
                      onTap: () {
                        Get.to(const AllBrandsScreen());
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: WileToneTextFormField(
                          controller: searchstores.value,
                          pIcon: WileToneImageWidget(
                            color: ColorUtils.lightGreyA6,
                            image: AppIconAssets.searchoicon,
                            imageType: ImageType.png,
                            height: 52.h,
                            // width: 24.w,
                          ),
                          filled: false,
                          height: 52.h,
                          borderSide:
                              const BorderSide(color: ColorUtils.lightGreyD7),
                          borderRadius: 57.sp,
                          hintText: VariablesUtils.searchstores,
                          hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: ColorUtils.lightGreyA6,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: WileToneTextWidget(
                      title: VariablesUtils.shop,
                      fontSize: 16.sp,
                      fontFamily: AssetsUtils.poppins,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.black,
                    ),
                  ),

                  Center(
                    child: GetBuilder<HomeViewModel>(

                      builder: (controller) {
                        if (controller.homePageApiResponse.status == Status.LOADING ||
                            controller.homePageApiResponse.status ==
                                Status.INITIAL){
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (controller.homePageApiResponse.status ==
                            Status.ERROR) {
                          return const Text("Some thing went wrong");
                        }

                        HomePageResModel model = controller.homePageApiResponse.data;

                     return Column(
                          children: [
                              GridView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 0.h),
                              shrinkWrap: true,
                              itemCount: model.data!.categoryList!.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 15.h),
                                  minVerticalPadding: 0,
                                  title: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.network(BaseService.categoryImage
                                      ,height: 70.h,
                                      width: 70.w,
                                    ),
                                  ),
                                  subtitle: Align(
                                    alignment: Alignment.topCenter,
                                    child: WileToneTextWidget(
                                      title: model.data!.categoryList![0].name
                                          .toString(),
                                      fontSize: 12.sp,
                                      fontFamily: AssetsUtils.poppins,
                                      fontWeight: FontWeight.w500,
                                      color: ColorUtils.black,
                                    ),
                                  ),
                                );
                              },
                            ),

                             ///Crousal Slider
                             CarouselSlider.builder(
                              itemCount: model.data!.bannerList!.length,
                              itemBuilder: (context, index, realIndex) {
                                return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 0.h),
                                    child: Image.network(
                                        BaseService.bannerImage));
                              },
                              options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    log("Index :- $index");
                                    log("Reason :- $reason");
                                    setState(() {
                                      current.value = index;
                                    });
                                  },
                                  autoPlayInterval: const Duration(seconds: 2),
                                  autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                                  enlargeCenterPage: false,
                                  scrollDirection: Axis.horizontal),
                            ),
                          ],
                        );
                      }

                    )
                  ),


                  // FutureBuilder(
                  //   future: homeViewModel.categoryList(),
                  //   builder: (context, snapshot) {
                  //     if(homeViewModel.homePageApiResponse.status == Status.COMPLETE) {
                  //
                  //       HomePageResModel res = homeViewModel.homePageApiResponse.data;
                  //
                  //       if (res.code == 200) {
                  //         log("Status code :- ${res.code}========================");
                  //         log("res :- ${res.message}");
                  //         log("Category :- ${res.data!.categoryList![0].name}");
                  //
                  //         return GridView.builder(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 0.w, vertical: 0.h),
                  //           shrinkWrap: true,
                  //           itemCount: res.data!.categoryList!.length,
                  //           gridDelegate:
                  //               const SliverGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 4),
                  //           itemBuilder: (context, index) {
                  //             return ListTile(
                  //               contentPadding: EdgeInsets.symmetric(
                  //                   horizontal: 0, vertical: 15.h),
                  //               minVerticalPadding: 0,
                  //               title: Align(
                  //                 alignment: Alignment.bottomCenter,
                  //                 child: WileToneImageWidget(
                  //                   image: res.data!.categoryList![0].image
                  //                       .toString(),
                  //                   imageType: ImageType.png,
                  //                   height: 70.h,
                  //                   width: 70.w,
                  //                 ),
                  //               ),
                  //               subtitle: Align(
                  //                 alignment: Alignment.topCenter,
                  //                 child: WileToneTextWidget(
                  //                   title: res.data!.categoryList![0].name
                  //                       .toString(),
                  //                   fontSize: 12.sp,
                  //                   fontFamily: AssetsUtils.poppins,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: ColorUtils.black,
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }
                  //     }
                  //     return const Center(child: CircularProgressIndicator());
                  //   },
                  // ),

                  SizedBox(
                    height: 20.h,
                  ),



                  SizedBox(
                    height: 10.h,
                  ),

                  /// Slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: AppIconAssets.listviewimages
                        .asMap()
                        .entries
                        .map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.value.animateToPage(entry.key),
                        child: Container(
                          width: 30.0.h,
                          height: 4.0.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: Colors.green.withOpacity(
                                  current.value == entry.key ? 1 : 0.1)),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  ///checkout rewards
                  InkWell(
                    onTap: () {
                      Get.to(const RewardScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        height: 52.h,
                        width: Get.width.w,
                        decoration: BoxDecoration(
                            color: ColorUtils.black,
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            const WileToneImageWidget(
                              image: AppIconAssets.reward,
                              imageType: ImageType.png,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            WileToneTextWidget(
                              title: VariablesUtils.check,
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.white,
                            ),
                            SizedBox(
                              width: 90.w,
                            ),
                            const WileToneImageWidget(
                              image: AppIconAssets.frontarrow,
                              imageType: ImageType.png,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 35.h,
                  ),

                  ///Filter data
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),

                      ///short data
                      InkWell(
                        onTap: () {
                          sortsheet.showSortData(context);
                        },
                        child: Container(
                          height: 30.h,
                          width: 69.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: ColorUtils.grey,
                              // Set the desired border color
                              width: 1.0, // Set the desired border width
                            ),
                            // color: ColorUtils.red
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              const WileToneImageWidget(
                                image: AppIconAssets.sort,
                                imageType: ImageType.png,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              WileToneTextWidget(
                                title: VariablesUtils.sorttext,
                                fontSize: 12.sp,
                                fontFamily: AssetsUtils.poppins,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.black,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              const WileToneImageWidget(
                                image: AppIconAssets.arrow,
                                imageType: ImageType.png,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 10.w,
                      ),

                      ///nearest
                      Container(
                        height: 30.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            color: ColorUtils.grey,
                            // Set the desired border color
                            width: 1.0, // Set the desired border width
                          ),
                          // color: ColorUtils.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            WileToneTextWidget(
                              title: VariablesUtils.near,
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.black,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10.w,
                      ),

                      ///Great Offers data
                      Container(
                        height: 30.h,
                        width: 86.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            color: ColorUtils.grey,
                            // Set the desired border color
                            width: 1.0, // Set the desired border width
                          ),
                          // color: ColorUtils.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            WileToneTextWidget(
                              title: VariablesUtils.greatoffer,
                              fontSize: 12.sp,
                              fontFamily: AssetsUtils.poppins,
                              fontWeight: FontWeight.w500,
                              color: ColorUtils.black,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),

                      ///Timing Data
                      InkWell(
                        onTap: () {
                          timesheet.showTimingData(context);
                        },
                        child: Container(
                          height: 30.h,
                          width: 69.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: ColorUtils.grey,
                              // Set the desired border color
                              width: 1.0, // Set the desired border width
                            ),
                            // color: ColorUtils.red
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              WileToneTextWidget(
                                title: VariablesUtils.Timing,
                                fontSize: 12.sp,
                                fontFamily: AssetsUtils.poppins,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.black,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const WileToneImageWidget(
                                image: AppIconAssets.arrow,
                                imageType: ImageType.png,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  ///Restaurant detail
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 0.w, vertical: 0.h),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(const RestaurantDetailScreen());
                        },
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 10.h),
                                child: SizedBox(
                                  // height : ,
                                  width: Get.width <= 290 ? 60 : 90,
                                  child: WileToneImageWidget(
                                    image: AppIconAssets.zomatoimage[index]
                                        .toString(),
                                    imageType: ImageType.png,
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 15.w,
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.width <= 280 ? 15.h : 25.h),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: WileToneTextWidget(
                                        title: VariablesUtils.hotelname[index]
                                            .toString(),
                                        fontSize: 20.sp,
                                        fontFamily: AssetsUtils.inter,
                                        fontWeight: FontWeight.w600,
                                        color: ColorUtils.black,
                                      ),
                                    ),
                                    WileToneTextWidget(
                                      title: VariablesUtils.foodname[index]
                                          .toString(),
                                      fontSize: 14.sp,
                                      fontFamily: AssetsUtils.inter,
                                      fontWeight: FontWeight.w400,
                                      color: ColorUtils.grey8D,
                                    ),
                                    Row(
                                      children: [
                                        WileToneTextWidget(
                                          title: VariablesUtils
                                              .discountpercentage[index]
                                              .toString(),
                                          fontSize: 24.sp,
                                          fontFamily: AssetsUtils.inter,
                                          fontWeight: FontWeight.w700,
                                          color: ColorUtils.lightgreen,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.h, top: 10.h),
                                          child: WileToneTextWidget(
                                            title: VariablesUtils.off[index]
                                                .toString(),
                                            fontSize: 15.sp,
                                            fontFamily: AssetsUtils.metrophobic,
                                            fontWeight: FontWeight.w700,
                                            color: ColorUtils.lightgreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 7.5,
                              ),

                              popup.popup(context)

                              // IconButton(onPressed: (){
                              //   log("================Click");
                              //        Get.to(const PopupMenu());
                              // }, icon: const Icon(Icons.more_vert,size: 20,color: ColorUtils.grey,)),

                              // InkWell(
                              //   onTap: () {
                              //     log("================Click");
                              //     const PopupMenu();
                              //   },
                              //   child: Padding(
                              //     padding: EdgeInsets.only(top: 20.h),
                              //     child: WileToneImageWidget(
                              //       image: AppIconAssets.dotimage[index].toString(),
                              //       imageType: ImageType.png,
                              //       scale: 1,
                              //     ),
                              //   ),
                              // ),
                            ]),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
