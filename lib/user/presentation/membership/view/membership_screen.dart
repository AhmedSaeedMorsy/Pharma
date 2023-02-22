// ignore_for_file: library_prefixes, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'dart:ui' as UI;
import '../../../../app/common/widget.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class MembershipScreen extends StatelessWidget {
  MembershipScreen({super.key});
  UI.TextDirection direction = UI.TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
            vertical: MediaQuery.of(context).size.height / AppSize.s80,
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
                    const Spacer(),
                    Text(
                      AppStrings.membership.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s18.sp,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s50),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppSize.s10,
                  ),
                  color: ColorManager.primaryLightColor,
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.monthlyPlan.tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: FontSizeManager.s12.sp,
                          ),
                    ),
                    Text(
                      "EGP 50",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: FontSizeManager.s24.sp,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.appIcon,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  AppSize.s150,
                            ),
                            Text(
                              "Narrowcasting",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: FontSizeManager.s8.sp,
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s40,
                        ),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.appIcon,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  AppSize.s150,
                            ),
                            Text(
                              "Free delivery",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: FontSizeManager.s8.sp,
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s40,
                        ),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.appIcon,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  AppSize.s150,
                            ),
                            Text(
                              "Value tier pricing",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: FontSizeManager.s8.sp,
                                  ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    SharedWidget.defaultButton(
                      label: AppStrings.subscribeNow.tr(),
                      context: context,
                      width: AppSize.s200.w,
                      background: ColorManager.white,
                      labelColor: ColorManager.primaryLightColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s50),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(
                    AppSize.s10,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.monthlyPlan.tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: FontSizeManager.s14.sp,
                            color: ColorManager.primaryDarkColor,
                          ),
                    ),
                    Text(
                      "EGP 50",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: FontSizeManager.s28.sp,
                            color: ColorManager.primaryDarkColor,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.appIcon,
                              ),
                              color: ColorManager.primaryLightColor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  AppSize.s150,
                            ),
                            Text(
                              "Narrowcasting",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: FontSizeManager.s8.sp,
                                    color: ColorManager.primaryDarkColor,
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s40,
                        ),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.appIcon,
                              ),
                              color: ColorManager.primaryLightColor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  AppSize.s150,
                            ),
                            Text(
                              "Free delivery",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: ColorManager.primaryDarkColor,
                                    fontSize: FontSizeManager.s8.sp,
                                  ),
                            )
                          ],
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / AppSize.s40,
                        ),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                AssetsManager.appIcon,
                              ),
                              color: ColorManager.primaryLightColor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  AppSize.s150,
                            ),
                            Text(
                              "Value tier pricing",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: ColorManager.primaryDarkColor,
                                    fontSize: FontSizeManager.s8.sp,
                                  ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s60,
                    ),
                    SharedWidget.defaultButton(
                      label: AppStrings.subscribeNow.tr(),
                      context: context,
                      width: AppSize.s200.w,
                      background: ColorManager.primaryDarkColor,
                      labelColor: ColorManager.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
