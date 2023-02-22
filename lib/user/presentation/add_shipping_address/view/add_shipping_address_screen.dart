import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'dart:ui' as UI;

import '../../../../app/common/widget.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class AddShippingAddressScreen extends StatelessWidget {
  const AddShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SharedWidget.defaultTextFormField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                context: context,
                fillColor: ColorManager.white,
                hint: AppStrings.home.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s100,
              ),
              SharedWidget.defaultTextFormField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                context: context,
                fillColor: ColorManager.white,
                hint: AppStrings.region.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s100,
              ),
              SharedWidget.defaultTextFormField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                context: context,
                fillColor: ColorManager.white,
                hint: AppStrings.street.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s100,
              ),
              Row(
                children: [
                  Expanded(
                    child: SharedWidget.defaultTextFormField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      context: context,
                      fillColor: ColorManager.white,
                      hint: AppStrings.department.tr(),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s20,
                  ),
                  Expanded(
                    child: SharedWidget.defaultTextFormField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      context: context,
                      fillColor: ColorManager.white,
                      hint: AppStrings.floor.tr(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s100,
              ),
              SharedWidget.defaultTextFormField(
                controller: TextEditingController(),
                textInputType: TextInputType.text,
                context: context,
                fillColor: ColorManager.white,
                hint: AppStrings.fullAddress.tr(),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s100,
              ),
              SharedWidget.defaultTextFormField(
                controller: TextEditingController(),
                textInputType: TextInputType.number,
                context: context,
                fillColor: ColorManager.white,
                hint: AppStrings.phone.tr(),
              ),
              const Spacer(),
              SharedWidget.defaultButton(
                label: AppStrings.save.tr(),
                context: context,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.layoutRoute,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
