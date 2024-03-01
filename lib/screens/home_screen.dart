import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task/components/name_item.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/assets.dart';
import 'package:task/view_models/home_view_model.dart';

import '../utils/strings.dart';
import '../utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeVM = Get.put(HomeViewModel());
  @override
  void initState() {
    homeVM.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset(
            AssetImages.menu,
            width: 37,
            height: 37,
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.online,
                  style: Styles.black30(),
                ),
                Text(
                  AppStrings.shope,
                  style: Styles.black30().copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              AppStrings.ecommApp.toUpperCase(),
              style: Styles.primary10(),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              AssetImages.search,
              width: 37,
              height: 37,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: AppColors.borderColor,
          ),
          SizedBox(
            height: 40,
            child: Obx(
              () => homeVM.responseData.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      scrollDirection:
                          Axis.horizontal, // Set scroll direction to horizontal
                      itemCount: homeVM
                          .names.length, // Set the number of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        int totalProducts =
                            homeVM.totalProductsByCategory(homeVM.names[index]);
                        return Container(
                          height: 32,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5), // Set the background color
                          child: NameItem(
                              name: homeVM.names[index],
                              number: totalProducts.toString()),
                        );
                      },
                    ),
            ),
          ),
          const Divider(
            color: AppColors.borderColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.bannerColor,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(AssetImages.bike),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.freeShip,
                        style: Styles.white18(),
                      ),
                      Text(
                        AppStrings.freeReturn,
                        style: Styles.white18().copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(AssetImages.phone)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
