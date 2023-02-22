// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'dart:ui' as UI;

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class MyCartScreen extends StatelessWidget {
  MyCartScreen({super.key});
  UI.TextDirection direction = UI.TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
          ),
          child: Column(
            children: [
              Directionality(
                textDirection: direction,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Directionality(
                        textDirection: direction,
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    Text(
                      AppStrings.myCart.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s18.sp,
                          ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.cancel.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Image(
                              image: AssetImage(
                                AssetsManager.demo,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / AppSize.s60,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Panadol Extra 24 tablets",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: ColorManager.primaryDarkColor,
                                      ),
                                ),
                                Text(
                                  "Box",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        fontSize: FontSizeManager.s12.sp,
                                      ),
                                ),
                                Text(
                                  "EGP  25",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height /
                                      AppSize.s50,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width /
                                                AppSize.s30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorManager.lightBlue,
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s5,
                                        ),
                                      ),
                                      child: Text(
                                        "-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: FontSizeManager.s18.sp,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          AppSize.s40,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorManager.lightBlue,
                                          borderRadius: BorderRadius.circular(
                                            AppSize.s5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "1",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontSize: FontSizeManager.s18.sp,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          AppSize.s40,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width /
                                                AppSize.s30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorManager.lightBlue,
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s5,
                                        ),
                                      ),
                                      child: Text(
                                        "+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: FontSizeManager.s18.sp,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / AppSize.s50,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSize.s18.w,
                          ),
                          border: Border.all(
                            color: ColorManager.primaryLightColor,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / AppSize.s30,
                                vertical: MediaQuery.of(context).size.height /
                                    AppSize.s80,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.subtotal.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        Text(
                                          AppStrings.pointsDiscount.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                        Text(
                                          AppStrings.delivery.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${AppStrings.egp.tr()} 25.00",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      Text(
                                        "${AppStrings.egp.tr()} 5.00",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      Text(
                                        "${AppStrings.egp.tr()} 20.00",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            Container(
                              color: ColorManager.primaryLightColor,
                              width: double.infinity,
                              height: AppSize.s1,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / AppSize.s30,
                                vertical: MediaQuery.of(context).size.height /
                                    AppSize.s80,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.total.tr(),
                                    style:
                                        Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  Text(
                                    "${AppStrings.egp.tr()} 50.00",
                                    style:
                                        Theme.of(context).textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/AppSize.s30,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width / AppSize.s30,
                          vertical:
                              MediaQuery.of(context).size.height / AppSize.s40,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.lightBlue,
                          borderRadius: BorderRadius.circular(
                            AppSize.s10,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.cashOnDelivery,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              AppStrings.cashOnDelivery.tr(),
                              style:
                                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: ColorManager.black,
                                      ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / AppSize.s100,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width / AppSize.s30,
                          vertical:
                              MediaQuery.of(context).size.height / AppSize.s40,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.lightBlue,
                          borderRadius: BorderRadius.circular(
                            AppSize.s10,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.visa,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              AppStrings.payWithCard.tr(),
                              style:
                                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: ColorManager.black,
                                      ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / AppSize.s20,
                      ),
                      SharedWidget.defaultButton(
                        label: AppStrings.gotoCheckout.tr(),
                        context: context,
                        width: double.infinity,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.paymentMethodRoute,
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / AppSize.s40,
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
