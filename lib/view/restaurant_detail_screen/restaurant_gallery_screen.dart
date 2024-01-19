import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';

import '../../utils/app_icon_assets.dart';
import '../../utils/color_utils.dart';
import '../../utils/variables_utils.dart';

class RestaurantGalleryScreen extends StatefulWidget {
  const RestaurantGalleryScreen({super.key});

  @override
  State<RestaurantGalleryScreen> createState() => _RestaurantGalleryScreenState();
}

class _RestaurantGalleryScreenState extends State<RestaurantGalleryScreen> {

  List<String> restaurantImage = [AppIconAssets.frame4, AppIconAssets.frame3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: const WileToneAppBar(title: VariablesUtils.hotelName,)),
              const SizedBox(height: 20,),
                  DefaultTabController(length: 3, child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
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
                          Tab( text: VariablesUtils.all,),
                          Tab( text: VariablesUtils.ambience,),
                          Tab( text: VariablesUtils.offering,),
                        ]),
                      ),

                      Container(
                        height: Get.height/2,
                        child: TabBarView(children: [
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GridView.builder(
                            itemCount: 4,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.3
                          ),
                              itemBuilder: (context,index){
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(restaurantImage[0]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (index == 1) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(restaurantImage[1]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (index == 2) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(restaurantImage[1]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (index == 3) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(restaurantImage[0]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                               return Container();
                              }),
                          ),
                          const Center(child: Text("View 2")),
                          const Center(child: Text("View 3")),
                        ]),
                      )
                    ],
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
