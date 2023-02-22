import 'package:equatable/equatable.dart';

class LayoutStates extends Equatable {
  final int index;
  const LayoutStates({
    this.index = 0,
  });
  LayoutStates copyWith({
    int? index,
  }) =>
      LayoutStates(
        index: index ?? this.index,
      );
  @override
  List<Object?> get props => [
        index,
      ];
}
