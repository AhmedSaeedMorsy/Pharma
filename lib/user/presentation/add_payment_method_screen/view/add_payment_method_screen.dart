// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'dart:ui' as UI;
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  AddPaymentMethodScreen({super.key});
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
              SharedWidget.defaultTextFormField(
                controller: TextEditingController(),
                textInputType: TextInputType.name,
                context: context,
                fillColor: ColorManager.primaryColor,
                hint: AppStrings.nameOnCard.tr(),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryLightColor,
                  ),
                ),
                textStyle: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              SharedWidget.defaultTextFormField(
                controller: TextEditingController(),
                textInputType: TextInputType.name,
                context: context,
                fillColor: ColorManager.primaryColor,
                hint: AppStrings.cardNumber.tr(),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryLightColor,
                  ),
                ),
                textStyle: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SharedWidget.defaultTextFormField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.none,
                      context: context,
                      fillColor: ColorManager.primaryColor,
                      hint: AppStrings.expiryDate.tr(),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primaryLightColor,
                        ),
                      ),
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(
                              days: 1000,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s50,
                  ),
                  Expanded(
                    flex: 1,
                    child: SharedWidget.defaultTextFormField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.name,
                      context: context,
                      fillColor: ColorManager.primaryColor,
                      hint: AppStrings.cvv,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primaryLightColor,
                        ),
                      ),
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
              const Spacer(),
               SharedWidget.defaultButton(
                label: AppStrings.accept.tr(),
                context: context,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.otpVerificationRoute,
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
