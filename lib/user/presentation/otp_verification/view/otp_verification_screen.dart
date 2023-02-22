// ignore_for_file: must_be_immutable, library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/common/widget.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import 'dart:ui' as UI;

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});
  UI.TextDirection direction = UI.TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
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
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / AppSize.s14,
                  right: MediaQuery.of(context).size.width / AppSize.s14,
                  top: MediaQuery.of(context).size.height / AppSize.s14,
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.putHereYourOTP.tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: ColorManager.black,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s220,
                    ),
                    Text(
                      AppStrings.descriptionOTP.tr(),
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: ColorManager.black,
                              ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s30,
                    ),
                    Directionality(textDirection: direction,
                      child: PinCodeTextField(
                        length: 4,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        cursorColor: ColorManager.primaryDarkColor,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          activeColor: ColorManager.grey,
                          selectedColor: ColorManager.white,
                          selectedFillColor: ColorManager.white,
                          inactiveFillColor: ColorManager.white,
                          inactiveColor: ColorManager.grey,
                          activeFillColor: ColorManager.white,
                        ),
                        animationDuration: const Duration(
                          milliseconds: AppIntDuration.duration500,
                        ),
                        enableActiveFill: true,
                        controller: TextEditingController(),
                        onCompleted: (value) {
                          // print("Completed");
                        },
                        onChanged: (value) {
                          // print(value);
                        },
                        beforeTextPaste: (text) {
                          // print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
                      ),
                    )
                  ],
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
                    Routes.successOtpVerificationRoute,
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
