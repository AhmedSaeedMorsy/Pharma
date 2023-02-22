// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'dart:ui' as UI;

import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class SuccessOtpVerificationScreen extends StatelessWidget {
  SuccessOtpVerificationScreen({super.key});
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
                      AppStrings.paymentMethod.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s18.sp,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),
              const Image(
                image: AssetImage(
                  AssetsManager.successOTP,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s150,
              ),
              Text(
                AppStrings.successDescriptionOTP.tr(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.black,
                    ),
              ),
              const Spacer(),
              SharedWidget.defaultButton(
                label: AppStrings.accept.tr(),
                context: context,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.layoutRoute,
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
}
