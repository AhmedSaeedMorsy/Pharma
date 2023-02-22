import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'package:pharma_retail/app/resources/strings_manager.dart';
import 'package:pharma_retail/app/resources/values_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';

class SharedWidget {
  static Widget defaultButton(
          {required String label,
          required BuildContext context,
          required double width,
          required Function() onPressed,
          double height = AppSize.s30,
          Color background = ColorManager.primaryLightColor,
          Color labelColor = ColorManager.white,
          double raidus = AppSize.s10}) =>
      Container(
        width: width,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(
            raidus,
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          color: background,
          onPressed: onPressed,
          child: Text(
            label,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: labelColor,
                ),
          ),
        ),
      );

  static Widget defaultTextFormField(
          {required TextEditingController controller,
          required TextInputType textInputType,
          required BuildContext context,
          bool obscure = false,
          String? Function(String?)? validator,
          Function()? onTap,
          Function(String value)? onChanged,
          String? hint,
          Widget? suffixIcon,
          Widget? prefixIcon,
          int maxLines = 1,
          Color? fillColor,
          InputBorder? border,
          InputBorder? focusedBorder,
          TextStyle? textStyle}) =>
      TextFormField(
        cursorColor: ColorManager.white,
        onTap: onTap,
        style: textStyle,
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          focusedBorder: focusedBorder,
          enabledBorder: border,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: ColorManager.grey,
              ),
          fillColor: fillColor,
          contentPadding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width / AppSize.s16),
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        maxLines: maxLines,
      );

  static Widget productItemWidget({
    required BuildContext context,
  }) =>
      InkWell(
        onTap: () {
          showPopupProduct(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s40,
            vertical: MediaQuery.of(context).size.height / AppSize.s220,
          ),
          decoration: BoxDecoration(
            color: ColorManager.lightBlue,
            borderRadius: BorderRadius.circular(
              AppSize.s10,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                  vertical: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / AppSize.s30,
                    vertical: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  child: const Image(
                    image: AssetImage(
                      AssetsManager.demo,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gasalia",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: FontSizeManager.s12.sp,
                                  color: ColorManager.black,
                                ),
                      ),
                      Text(
                        "Tablets",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Text(
                    "EGP 45",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  static void showPopupProduct(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FadeInDown(
          duration: const Duration(milliseconds: AppIntDuration.duration500),
          child: Column(
            children: [
              Container(
                height: AppSize.s300.h,
                color: ColorManager.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s30,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s20,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.productDetails.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: ColorManager.primaryDarkColor,
                                  ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s50,
                        ),
                        Container(
                          color: ColorManager.grey,
                          width: double.infinity,
                          height: AppSize.s1.h,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s20,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Image(
                            image: const AssetImage(
                              AssetsManager.demo,
                            ),
                            width:
                                MediaQuery.of(context).size.width / AppSize.s5,
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s50,
                        ),
                        Text(
                          "Panadol Extra 24 tablets",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: ColorManager.primaryDarkColor,
                              ),
                        ),
                        Text(
                          "Box",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: FontSizeManager.s14.sp,
                              ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "EGP  25",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            defaultButton(
                              label: AppStrings.addToCart.tr(),
                              context: context,
                              width: MediaQuery.of(context).size.width /
                                  AppSize.s2,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.myCartRoute,
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30,
                        ),
                        Container(
                          color: ColorManager.grey,
                          width: double.infinity,
                          height: AppSize.s1.h,
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.lightBlue,
                            borderRadius: BorderRadius.circular(
                              AppSize.s10,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width / AppSize.s30,
                            vertical: MediaQuery.of(context).size.height /
                                AppSize.s60,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.description.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: ColorManager.primaryDarkColor,
                                    ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    AppSize.s50,
                              ),
                              Text(
                                AppStrings.notificationDemo,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height / AppSize.s50,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Widget bestDealsWidget({
    required BuildContext context,
    Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          width: AppSize.s100.w,
          height: AppSize.s100.h,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s30,
            vertical: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          decoration: BoxDecoration(
            color: ColorManager.lightBlue,
            borderRadius: BorderRadius.circular(
              AppSize.s10,
            ),
          ),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s30,
              vertical: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            child: Image(
              image: const AssetImage(
                AssetsManager.demo,
              ),
              width: AppSize.s100.w,
              height: AppSize.s100.h,
            ),
          ),
        ),
      );
  static Widget postItem({required BuildContext context}) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / AppSize.s25,
            vertical: MediaQuery.of(context).size.height / AppSize.s60),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                AppSize.s10,
              )),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / AppSize.s25,
              vertical: MediaQuery.of(context).size.height / AppSize.s60),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: const AssetImage(
                      AssetsManager.demo,
                    ),
                    width: AppSize.s50.w,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s50,
                  ),
                  Text(
                    "Pharmacy Name",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: ColorManager.primaryDarkColor,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s30,
              ),
              Text(
                AppStrings.notificationDemo,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: FontSizeManager.s14.sp,
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s30,
              ),
              Image(
                image: const AssetImage(
                  AssetsManager.demo,
                ),
                height: MediaQuery.of(context).size.width / AppSize.s1_5,
                width: double.infinity,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s30,
              ),
            ],
          ),
        ),
      );
}
