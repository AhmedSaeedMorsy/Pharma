import 'package:equatable/equatable.dart';

abstract class LayoutBaseEvent extends Equatable {}

class ChangeBottomNavBar extends LayoutBaseEvent {
  final int index;
  ChangeBottomNavBar(this.index);
  @override
  List<Object?> get props => [
        index,
      ];
}
