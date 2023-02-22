// ignore_for_file: library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'package:pharma_retail/app/resources/font_manager.dart';
import 'dart:ui' as UI;

import 'package:pharma_retail/app/resources/strings_manager.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/values_manager.dart';

class SalvageProductScreen extends StatelessWidget {
  SalvageProductScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / AppSize.s30,
            left: MediaQuery.of(context).size.width / AppSize.s30,
            top: MediaQuery.of(context).size.height / AppSize.s50,
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
                      AppStrings.salvageProducts.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s16.sp,
                          ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.myCartRoute,
                        );
                      },
                      icon: const Image(
                        image: AssetImage(AssetsManager.cart),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              SharedWidget.defaultTextFormField(
                controller: searchController,
                textInputType: TextInputType.text,
                context: context,
                fillColor: ColorManager.lightGrey,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorManager.primaryLightColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSize.s50,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorManager.white,
                  ),
                  borderRadius: BorderRadius.circular(
                    AppSize.s50,
                  ),
                ),
                textStyle: Theme.of(context).textTheme.headlineSmall,
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: ColorManager.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.filterRoute,
                    );
                  },
                  icon: const Image(
                    image: AssetImage(AssetsManager.filter),
                    color: ColorManager.primaryDarkColor,
                  ),
                ),
                hint: AppStrings.searchHint.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Text(
                AppStrings.salvageDescrpition.tr(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.black,
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SharedWidget.productItemWidget(context: context);
                  },
                  semanticChildCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppSize.s20.w,
                    crossAxisSpacing: AppSize.s20.h,
                    childAspectRatio: 1 / 1.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
