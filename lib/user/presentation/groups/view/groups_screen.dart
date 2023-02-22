import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_retail/app/resources/assets_manager.dart';

import '../../../../app/common/widget.dart';
import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/routes_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

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
          AppStrings.groups.tr(),
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: ColorManager.primaryDarkColor,
              ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / AppSize.s25,
                  vertical: MediaQuery.of(context).size.height / AppSize.s60),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s8,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SharedWidget.bestDealsWidget(
                    context: context,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.groupDetailsRoute,
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width / AppSize.s30,
                  ),
                  itemCount: 10,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    SharedWidget.postItem(context: context),
                separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height / AppSize.s80,
                    ),
                itemCount: 10)
          ],
        ),
      ),
    );
  }
}
