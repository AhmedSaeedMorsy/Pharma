// ignore_for_file: library_prefixes, must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'dart:ui' as UI;

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

    return Scaffold(
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
                    Text(
                      AppStrings.filter.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s18.sp,
                          ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.clearAll.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              dropDownItem(
                context: context,
                label: AppStrings.category.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s80,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / AppSize.s18,
                ),
                child: Container(
                  color: ColorManager.primaryLightColor,
                  width: double.infinity,
                  height: AppSize.s1,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              dropDownItem(
                context: context,
                label: AppStrings.brandName.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s80,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / AppSize.s18,
                ),
                child: Container(
                  color: ColorManager.primaryLightColor,
                  width: double.infinity,
                  height: AppSize.s1,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / AppSize.s18,
                ),
                child: Text(
                  AppStrings.price.tr(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / AppSize.s18,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SharedWidget.defaultTextFormField(
                        controller: TextEditingController(),
                        textInputType: TextInputType.number,
                        context: context,
                        hint: AppStrings.from.tr(),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / AppSize.s10,
                    ),
                    Expanded(
                      child: SharedWidget.defaultTextFormField(
                        controller: TextEditingController(),
                        textInputType: TextInputType.number,
                        context: context,
                        hint: AppStrings.to.tr(),
                      ),
                    ),
                  ],
                ),
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

  Widget dropDownItem({required BuildContext context, required String label}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: ColorManager.grey,
                      fontSize: FontSizeManager.s16.sp,
                    ),
              ),
            ),
          ],
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.headlineSmall!,
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          // setState(() {
          //   selectedValue = value as String;
          // });
        },
        icon: const Icon(
          Icons.arrow_right_rounded,
        ),
        buttonHeight: AppSize.s40.h,
        buttonWidth: double.infinity,
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSize.s55.w,
          ),
        ),
        buttonPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / AppSize.s18,
        ),
        itemHeight: AppSize.s30.h,
        dropdownMaxHeight: AppSize.s150.h,
        scrollbarRadius: Radius.circular(
          AppSize.s10.w,
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              AppSize.s20.w,
            ),
            bottomRight: Radius.circular(
              AppSize.s20.w,
            ),
          ),
          color: ColorManager.white,
        ),
        scrollbarThickness: AppSize.s8.w,
      ),
    );
  }
}
