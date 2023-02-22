import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'package:pharma_retail/app/resources/strings_manager.dart';
import 'package:pharma_retail/app/resources/values_manager.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        title: Text(
          AppStrings.notification.tr(),
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: ColorManager.primaryDarkColor,
              ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / AppSize.s20,
          right: MediaQuery.of(context).size.width / AppSize.s20,
          top: MediaQuery.of(context).size.height / AppSize.s40,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => notificationItem(
            context: context,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          itemCount: 10,
        ),
      ),
    );
  }

  Widget notificationItem({
    required BuildContext context,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: ColorManager.lightBlue,
          borderRadius: BorderRadius.circular(
            AppSize.s10,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / AppSize.s50,
          vertical: MediaQuery.of(context).size.height / AppSize.s60,
        ),
        child: Text(
          AppStrings.notificationDemo,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
}
