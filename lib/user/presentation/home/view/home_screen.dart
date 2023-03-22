// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'package:pharma_retail/app/resources/font_manager.dart';
import 'package:pharma_retail/app/resources/routes_manager.dart';
import 'package:pharma_retail/app/resources/strings_manager.dart';
import 'package:pharma_retail/app/resources/values_manager.dart';
import 'package:pharma_retail/user/presentation/best_deals/view/best_deals_screen.dart';

import '../../../../app/resources/styles_manager.dart';
import '../../new_product/view/new_product_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> listBanner = [
    AssetsManager.banner,
  ];

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideInDown(
            duration: const Duration(
              milliseconds: AppIntDuration.duration500,
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / AppSize.s25,
                right: MediaQuery.of(context).size.width / AppSize.s25,
                top: MediaQuery.of(context).size.height / AppSize.s20,
              ),
              color: ColorManager.primaryDarkColor,
              height: MediaQuery.of(context).size.height / AppSize.s4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.welcomeToPharmaRetail.tr(),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: FontSizeManager.s16.sp,
                                ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.myCartRoute,
                          );
                        },
                        child: Image(
                          image: const AssetImage(
                            AssetsManager.cart,
                          ),
                          width: AppSize.s22.w,
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  SharedWidget.defaultTextFormField(
                    controller: searchController,
                    textInputType: TextInputType.text,
                    context: context,
                    fillColor: ColorManager.lightGrey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorManager.primaryLightColor,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppSize.s50,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorManager.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppSize.s50,
                      ),
                    ),
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      color: ColorManager.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.filterRoute,
                        );
                      },
                      icon: const Image(
                        image: AssetImage(AssetsManager.filter),
                        color: ColorManager.primaryDarkColor,
                      ),
                    ),
                    hint: AppStrings.searchHint.tr(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          SlideInRight(
            duration: const Duration(
              milliseconds: AppIntDuration.duration500,
            ),
            child: CarouselSlider(
              items: listBanner
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(
                          AppSize.s10,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            e,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: AppSize.s120.h,
                viewportFraction: .8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(
                  seconds: AppIntDuration.duration3,
                ),
                autoPlayAnimationDuration: const Duration(
                  milliseconds: AppIntDuration.duration500,
                ),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.bestDeals.tr(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: ColorManager.primaryDarkColor,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BestDealsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppStrings.viewAll.tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s25,
                vertical: MediaQuery.of(context).size.height / AppSize.s60),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s8,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    bestDealsWidget(context: context),
                separatorBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                itemCount: 10,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: AppStrings.salvageProducts.tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: ColorManager.primaryDarkColor,
                          ),
                      children: [
                        TextSpan(
                          text: "(${AppStrings.month3_6})",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: FontSizeManager.s12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.salvageProductRoute,
                    );
                  },
                  child: Text(
                    AppStrings.viewAll.tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
              vertical: MediaQuery.of(context).size.height / AppSize.s60,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s8,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    salvageWidget(context: context),
                separatorBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                itemCount: 10,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.newProducts.tr(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: ColorManager.primaryDarkColor,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewProductScreen(),
                        ));
                  },
                  child: Text(
                    AppStrings.viewAll.tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SharedWidget.productItemWidget(
                    context: context,
                  ),
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                Expanded(
                  child: SharedWidget.productItemWidget(
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.recomendationProduct.tr(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: ColorManager.primaryDarkColor,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.recomendationProductRoute,
                    );
                  },
                  child: Text(
                    AppStrings.viewAll.tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SharedWidget.productItemWidget(
                    context: context,
                  ),
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                Expanded(
                  child: SharedWidget.productItemWidget(
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Text(
              AppStrings.shopByCategory.tr(),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: ColorManager.primaryDarkColor,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s25,
                vertical: MediaQuery.of(context).size.height / AppSize.s60),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s8,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    SharedWidget.bestDealsWidget(context: context),
                separatorBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s30,
                ),
                itemCount: 10,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: Text(
              AppStrings.shopByBrand.tr(),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: ColorManager.primaryDarkColor,
                  ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return brandItem(context: context);
              },
              semanticChildCount: 2,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSize.s20.w,
                crossAxisSpacing: AppSize.s20.h,
                childAspectRatio: 3 / 1,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s30,
          ),
        ],
      ),
    );
  }

  Widget salvageWidget({
    required BuildContext context,
  }) =>
      Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: AppSize.s100.w,
            height: AppSize.s100.h,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s30,
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            decoration: BoxDecoration(
              color: ColorManager.lightBlue,
              borderRadius: BorderRadius.circular(
                AppSize.s10,
              ),
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                vertical: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              child: Image(
                image: const AssetImage(
                  AssetsManager.demo,
                ),
                width: AppSize.s100.w,
                height: AppSize.s100.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                vertical: MediaQuery.of(context).size.height / AppSize.s350,
              ),
              decoration: const BoxDecoration(
                color: ColorManager.red,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(
                    AppSize.s5,
                  ),
                  bottomStart: Radius.circular(
                    AppSize.s5,
                  ),
                ),
              ),
              child: Text(
                "-30%",
                style: getBoldStyle(
                  fontSize: FontSizeManager.s10.sp,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                  vertical: MediaQuery.of(context).size.height / AppSize.s350,
                ),
                decoration: const BoxDecoration(
                  color: ColorManager.primaryDarkColor,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(
                      AppSize.s5,
                    ),
                    bottomStart: Radius.circular(
                      AppSize.s5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "4",
                      style: getBoldStyle(
                        fontSize: FontSizeManager.s10.sp,
                        color: ColorManager.white,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.white,
                      size: AppSize.s10.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget bestDealsWidget({
    required BuildContext context,
  }) =>
      Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: AppSize.s100.w,
            height: AppSize.s100.h,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s30,
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            decoration: BoxDecoration(
              color: ColorManager.lightBlue,
              borderRadius: BorderRadius.circular(
                AppSize.s10,
              ),
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                vertical: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              child: Image(
                image: const AssetImage(
                  AssetsManager.demo,
                ),
                width: AppSize.s100.w,
                height: AppSize.s100.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                vertical: MediaQuery.of(context).size.height / AppSize.s350,
              ),
              decoration: const BoxDecoration(
                color: ColorManager.red,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(
                    AppSize.s5,
                  ),
                  bottomStart: Radius.circular(
                    AppSize.s5,
                  ),
                ),
              ),
              child: Text(
                "-30%",
                style: getBoldStyle(
                  fontSize: FontSizeManager.s10.sp,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      );

  Widget brandItem({
    required BuildContext context,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.lightBlue,
          ),
          borderRadius: BorderRadius.circular(
            AppSize.s10,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / AppSize.s30,
        ),
        child: const Image(
          image: AssetImage(
            AssetsManager.brandDemo,
          ),
        ),
      );
}
