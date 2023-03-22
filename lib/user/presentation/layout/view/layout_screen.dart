// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'package:pharma_retail/app/resources/values_manager.dart';
import 'package:pharma_retail/user/presentation/layout/controller/bloc.dart';
import 'package:pharma_retail/user/presentation/layout/controller/event.dart';
import 'package:pharma_retail/user/presentation/layout/controller/states.dart';
import '../../../../app/resources/assets_manager.dart';
import 'dart:ui' as UI;
class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UI.TextDirection direction = UI.TextDirection.ltr;

    return BlocProvider(
      create: (context) => LayoutBloc(),
      child: BlocBuilder<LayoutBloc, LayoutStates>(builder: (context, state) {
        return Scaffold(
          body: LayoutBloc.get(context).screens[LayoutBloc.get(context).index],
          bottomNavigationBar: Directionality(
            textDirection: direction,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Image(
                    image: const AssetImage(
                      AssetsManager.home,
                    ),
                    color: LayoutBloc.get(context).index == 0
                        ? ColorManager.white
                        : ColorManager.primaryLightColor,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: const AssetImage(
                      AssetsManager.search,
                    ),
                    color: LayoutBloc.get(context).index == 1
                        ? ColorManager.white
                        : ColorManager.primaryLightColor,
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                    icon: Image(
                      image: const AssetImage(
                        AssetsManager.points,
                      ),
                      color: LayoutBloc.get(context).index == 2
                          ? ColorManager.white
                          : ColorManager.primaryLightColor,
                    ),
                    label: "points"),
                BottomNavigationBarItem(
                    icon: Image(
                      image: const AssetImage(
                        AssetsManager.group,
                      ),
                      color: LayoutBloc.get(context).index == 3
                          ? ColorManager.white
                          : ColorManager.primaryLightColor,
                    ),
                    label: "Group"),
                BottomNavigationBarItem(
                    icon: Image(
                      image: const AssetImage(
                        AssetsManager.notification,
                      ),
                      color: LayoutBloc.get(context).index == 4
                          ? ColorManager.white
                          : ColorManager.primaryLightColor,
                    ),
                    label: "Notification"),
                BottomNavigationBarItem(
                    icon: Image(
                      image: const AssetImage(
                        AssetsManager.user,
                      ),
                      color: LayoutBloc.get(context).index == 5
                          ? ColorManager.white
                          : ColorManager.primaryLightColor,
                    ),
                    label: "Profile"),
              ],
              backgroundColor: ColorManager.primaryDarkColor,
              type: BottomNavigationBarType.fixed,
              elevation: AppSize.s0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: LayoutBloc.get(context).index,
              onTap: (index) {
                LayoutBloc.get(context).add(
                  ChangeBottomNavBar(
                    index,
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
