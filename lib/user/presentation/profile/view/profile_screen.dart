import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';

import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / AppSize.s20,
            left: MediaQuery.of(context).size.width / AppSize.s20,
            top: MediaQuery.of(context).size.height / AppSize.s50,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / AppSize.s30,
                    left: MediaQuery.of(context).size.width / AppSize.s30,
                    top: MediaQuery.of(context).size.height / AppSize.s50,
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.profile.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: FontSizeManager.s18.sp,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppSize.s30,
                ),
                profileItem(
                  context: context,
                  label: AppStrings.name.tr(),
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
                profileItem(
                  context: context,
                  label: AppStrings.phone.tr(),
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
                profileItem(
                  context: context,
                  label: AppStrings.location.tr(),
                  icon: const Icon(Icons.arrow_right_outlined),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.locationsRoute,
                    );
                  },
                ),
                profileItem(
                  context: context,
                  label: AppStrings.email.tr(),
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
                profileItem(
                  context: context,
                  label: AppStrings.orderHistory.tr(),
                  icon: const Icon(Icons.arrow_right_outlined),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.ordersRoute,
                    );
                  },
                ),
                profileItem(
                  context: context,
                  label: AppStrings.membership.tr(),
                  icon: const Icon(Icons.arrow_right_outlined),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.membershipRoute,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileItem({
    required BuildContext context,
    required String label,
    required Icon icon,
    required Function() onPressed,
  }) =>
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              InkWell(
                onTap: onPressed,
                child: icon,
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s80,
          ),
          Container(
            color: ColorManager.primaryLightColor,
            width: double.infinity,
            height: AppSize.s1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / AppSize.s20,
          ),
        ],
      );
}
