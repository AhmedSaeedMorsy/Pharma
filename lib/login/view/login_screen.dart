// ignore_for_file: library_prefixes

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'package:pharma_retail/app/resources/font_manager.dart';
import 'package:pharma_retail/app/resources/strings_manager.dart';
import 'package:pharma_retail/app/resources/values_manager.dart';
import 'package:pharma_retail/login/controller/bloc.dart';
import 'package:pharma_retail/login/controller/event.dart';
import 'package:pharma_retail/login/controller/states.dart';
import '../../app/resources/color_manager.dart';
import 'dart:ui' as UI;

import '../../app/resources/routes_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primaryDarkColor,
            appBar: AppBar(
              backgroundColor: ColorManager.primaryDarkColor,
              automaticallyImplyLeading: false,
              elevation: AppSize.s0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: ColorManager.primaryDarkColor,
                  statusBarIconBrightness: Brightness.light),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / AppSize.s20,
                  right: MediaQuery.of(context).size.width / AppSize.s20,
                  bottom: MediaQuery.of(context).size.height / AppSize.s40),
              child: Form(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: direction,
                        child: Align(
                          alignment: AlignmentDirectional.topStart,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: ColorManager.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          AppStrings.createAnAccountOrLogin.tr(),
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s18,
                      ),
                      Center(
                        child: Text(
                          AppStrings.continueWith.tr(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s32,
                      ),
                      SharedWidget.defaultTextFormField(
                        controller: phoneController,
                        textInputType: TextInputType.emailAddress,
                        context: context,
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
                        hint: AppStrings.phoneNumberOrEmail.tr(),
                        textStyle: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s60,
                      ),
                      if (state.isFound == true)
                        Column(
                          children: [
                            SharedWidget.defaultTextFormField(
                              controller: phoneController,
                              textInputType: TextInputType.emailAddress,
                              context: context,
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
                              hint: AppStrings.password.tr(),
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  AppSize.s60,
                            ),
                          ],
                        ),
                      SharedWidget.defaultButton(
                        label: AppStrings.login.tr(),
                        context: context,
                        width: double.infinity,
                        height: AppSize.s40,
                        raidus: AppSize.s50,
                        onPressed: () {
                          LoginBloc.get(context).add(ShowPasswordField());
                          if (state.isFound) {
                            Navigator.pushNamed(
                              context,
                              Routes.layoutRoute,
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s60,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width / AppSize.s12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: ColorManager.white,
                                height: AppSize.s1.h,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width /
                                    AppSize.s20,
                              ),
                              child: Text(
                                AppStrings.or.tr(),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: ColorManager.white,
                                width: double.infinity,
                                height: AppSize.s1.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s24,
                      ),
                      Text(
                        AppStrings.loginWith,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s24,
                      ),
                      socialLoginWidget(
                        context: context,
                        label: AppStrings.facebook,
                        image: AssetsManager.facebook,
                      ),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.height / AppSize.s60,
                      ),
                      socialLoginWidget(
                        context: context,
                        label: AppStrings.google,
                        image: AssetsManager.google,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / AppSize.s6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.byContinuingYouAgreeTo.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: FontSizeManager.s8.sp,
                                ),
                          ),
                          SizedBox(
                            width: AppSize.s1.w,
                          ),
                          Text(
                            AppStrings.termsCondition.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: FontSizeManager.s8.sp,
                                  color: ColorManager.primaryLightColor,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget socialLoginWidget({
    required BuildContext context,
    required String image,
    required String label,
  }) {
    UI.TextDirection direction = UI.TextDirection.ltr;
    return Directionality(
      textDirection: direction,
      child: Container(
        width: double.infinity,
        height: AppSize.s40.h,
        decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadiusDirectional.circular(
            AppSize.s50,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / AppSize.s12),
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / AppSize.s12),
              child: Center(
                  child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: ColorManager.primaryDarkColor),
              )),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
