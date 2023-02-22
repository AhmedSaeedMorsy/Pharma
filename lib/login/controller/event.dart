import 'package:equatable/equatable.dart';

abstract class LoginBaseEvent extends Equatable {}

class ShowPasswordField extends LoginBaseEvent {
  @override
  List<Object?> get props => [];
}
