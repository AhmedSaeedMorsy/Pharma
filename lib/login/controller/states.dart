import 'package:equatable/equatable.dart';

class LoginStates extends Equatable {
  final bool isFound;
  const LoginStates({this.isFound = false});
  LoginStates copyWith({
    required bool? isFound,
  }) =>
      LoginStates(
        isFound: isFound ?? this.isFound,
      );
  @override
  List<Object?> get props => [
        isFound,
      ];
}
