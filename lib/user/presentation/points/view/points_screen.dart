import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import '../../../../app/resources/assets_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / AppSize.s30,
                left: MediaQuery.of(context).size.width / AppSize.s30,
                top: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              child: Center(
                child: Text(
                  AppStrings.points.tr(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: FontSizeManager.s18.sp,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s30,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                vertical: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              width: double.infinity,
              color: ColorManager.lightGrey,
              child: Column(
                children: [
                  Image(
                    image: const AssetImage(
                      AssetsManager.pointsScale,
                    ),
                    width: AppSize.s80.w,
                    height: AppSize.s80.h,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  Text(
                    AppStrings.pointBalance.tr(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: FontSizeManager.s16.sp,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s100,
                  ),
                  Text(
                    "0 ${AppStrings.points.tr()}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: FontSizeManager.s16.sp,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s100,
                  ),
                  Text(
                    AppStrings.pointsDescription.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
