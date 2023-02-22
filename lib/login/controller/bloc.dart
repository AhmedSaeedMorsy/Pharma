import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_retail/login/controller/event.dart';
import 'package:pharma_retail/login/controller/states.dart';

class LoginBloc extends Bloc<LoginBaseEvent, LoginStates> {
  LoginBloc() : super(const LoginStates()) {
    on<ShowPasswordField>(
      _showPasswordField,
    );
  }
  static LoginBloc get(context) => BlocProvider.of(context);
  FutureOr<void> _showPasswordField(event, emit) async {
    emit(state.copyWith(isFound: true));
  }
}
