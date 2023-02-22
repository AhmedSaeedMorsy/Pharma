import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';
import 'package:pharma_retail/app/resources/strings_manager.dart';
import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/values_manager.dart';
import 'dart:ui' as UI;

class GroupDetailsScreen extends StatelessWidget {
  GroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Stack(
                children: [
                  Image(
                    image: const AssetImage(
                      AssetsManager.banner,
                    ),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / AppSize.s5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / AppSize.s50,
                      left: MediaQuery.of(context).size.height / AppSize.s100,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Directionality(
                          textDirection: direction,
                          child: const CircleAvatar(
                            radius: AppSize.s16,
                            backgroundColor: ColorManager.white,
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: AppSize.s8,
                              ),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: ColorManager.primaryDarkColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / AppSize.s25,
                    vertical: MediaQuery.of(context).size.height / AppSize.s60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Group name",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: ColorManager.primaryDarkColor,
                          ),
                    ),
                    SharedWidget.defaultButton(
                      label: AppStrings.joined.tr(),
                      context: context,
                      onPressed: () {},
                      width: MediaQuery.of(context).size.width / AppSize.s3,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s100,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    SharedWidget.postItem(context: context),
                separatorBuilder: (context, index) => SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s80,
                ),
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
