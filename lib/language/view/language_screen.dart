// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/common/widget.dart';
import 'package:pharma_retail/app/resources/routes_manager.dart';
import 'package:pharma_retail/app/resources/strings_manager.dart';
import 'package:pharma_retail/app/resources/values_manager.dart';
import 'package:pharma_retail/language/controller/bloc.dart';
import 'package:pharma_retail/language/controller/states.dart';
import '../../app/constant/enums_extentions.dart';
import '../../app/resources/color_manager.dart';
import '../../app/resources/language_manager.dart';
import '../../app/services/shared_prefrences/cache_helper.dart';
import '../controller/event.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageBloc(),
      child:
          BlocBuilder<LanguageBloc, LanguageStates>(builder: (context, state) {
        LanguageEnum language = state.language;
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / AppSize.s10,
              horizontal: MediaQuery.of(context).size.width / AppSize.s10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.chooseLanguage.tr(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  child: Container(
                    color: ColorManager.primaryLightColor,
                    width: double.infinity,
                    height: AppSize.s2.h,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      AppStrings.english,
                      style: Theme.of(context).textTheme.headlineSmall,
                    )),
                    Radio(
                      value: LanguageEnum.english,
                      groupValue: language,
                      onChanged: (value) {
                        language = value!;
                        if (language == LanguageEnum.english) {
                          CacheHelper.setData(
                              key: SharedKey.Language,
                              value: LanguageType.ENGLISH.getValue());
                        }
                        LanguageBloc.get(context).add(
                          ChooseLanguageEvent(
                            language,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppStrings.arabic,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Radio(
                      value: LanguageEnum.arabic,
                      groupValue: language,
                      onChanged: (value) {
                        language = value!;
                        LanguageBloc.get(context)
                            .add(ChooseLanguageEvent(value));
                        if (value == LanguageEnum.arabic) {
                          CacheHelper.setData(
                              key: SharedKey.Language,
                              value: LanguageType.ARABIC.getValue());
                        }
                      },
                    ),
                  ],
                ),
                const Spacer(),
                SharedWidget.defaultButton(
                  label: AppStrings.done,
                  context: context,
                  width: double.infinity,
                  onPressed: () {
                    getLocal().then((local) => {context.setLocale(local)});
                    Navigator.pushNamed(
                      context,
                      Routes.loginRoute,
                    );
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
