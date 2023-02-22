import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_retail/app/resources/color_manager.dart';
import 'package:pharma_retail/user/presentation/groups/view/groups_screen.dart';
import 'package:pharma_retail/user/presentation/layout/controller/event.dart';
import 'package:pharma_retail/user/presentation/layout/controller/states.dart';
import 'package:pharma_retail/user/presentation/profile/view/profile_screen.dart';

import '../../home/view/home_screen.dart';
import '../../../../notification/view/notification_screen.dart';
import '../../points/view/points_screen.dart';
import '../../search/view/search_screen.dart';

class LayoutBloc extends Bloc<LayoutBaseEvent, LayoutStates> {
  static LayoutBloc get(context) => BlocProvider.of(context);
  LayoutBloc() : super(const LayoutStates()) {
    on<ChangeBottomNavBar>(
      _changeBottomNavBar,
    );
  }
  int index = 0;
  void _changeBottomNavBar(event, emit) {
    index = event.index;
    emit(
      state.copyWith(
        index: event.index,
      ),
    );
  }

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    const PointsScreen(),
    const GroupsScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = const [];
  Color iconColor(int index) {
    if (index == this.index) {
      return ColorManager.white;
    }
    return ColorManager.primaryLightColor;
  }
}
