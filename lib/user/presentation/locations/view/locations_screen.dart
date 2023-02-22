// ignore_for_file: library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'dart:ui' as UI;
import '../../../../app/common/widget.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;
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
                      AppStrings.location.tr(),
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
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => locationItem(
                    context: context,
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  itemCount: 10,
                ),
              ),
              SharedWidget.defaultButton(
                label: AppStrings.addShippingAddress.tr(),
                context: context,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addShippingAddressRoute,
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationItem({
    required BuildContext context,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / AppSize.s20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "place NAME".toUpperCase(),
                ),
                const Icon(
                  Icons.delete,
                  color: ColorManager.primaryLightColor,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / AppSize.s120,
                  ),
                  child: const Image(
                    image: AssetImage(
                      AssetsManager.location,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s50,
                ),
                Expanded(
                  child: Text(
                    """lorem ipsum, lorem ipsum, lorem ipsum, lorem ipsum, lorem ipsum, lorem ipsum, lorem ipsum""",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: ColorManager.black,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s80,
            ),
            Row(
              children: [
                const Image(
                  image: AssetImage(
                    AssetsManager.phone,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / AppSize.s50,
                ),
                Text(
                  "01112232521",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorManager.black,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            Container(
              color: ColorManager.primaryLightColor,
              width: double.infinity,
              height: AppSize.s1,
            ),
          ],
        ),
      );
}
