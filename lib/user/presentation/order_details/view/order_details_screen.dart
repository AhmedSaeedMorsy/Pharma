import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as UI;

import '../../../../app/resources/assets_manager.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

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
                    const Spacer(),
                    Text(
                      AppStrings.orderDetails.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s18.sp,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s30,
              ),
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => orderDetailsItem(
                          context: context,
                        ),
                    separatorBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height /
                                AppSize.s50,
                          ),
                          child: Container(
                            color: ColorManager.primaryLightColor,
                            width: double.infinity,
                            height: AppSize.s1,
                          ),
                        ),
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget orderDetailsItem({required BuildContext context}) => Row(
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
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorManager.primaryDarkColor,
                      ),
                ),
                Text(
                  "Box",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: FontSizeManager.s16.sp,
                      ),
                ),
                Text(
                  "EGP  25",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorManager.primaryDarkColor,
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
              ],
            ),
          ),
        ],
      );
}
