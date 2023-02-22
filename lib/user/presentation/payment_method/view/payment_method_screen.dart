// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'dart:ui' as UI;
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key});
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
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s30,
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage(
                        AssetsManager.creditCard,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s30,
                    ),
                    Text(
                      AppStrings.noCardsSaved.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.black,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s80,
                    ),
                    Text(
                      AppStrings.addCardDescription.tr(),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: FontSizeManager.s14.sp,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s20,
                    ),
                    SharedWidget.defaultButton(
                      label: AppStrings.addCard.tr(),
                      context: context,
                      width: AppSize.s150.w,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.addPaymentMethodRoute,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
