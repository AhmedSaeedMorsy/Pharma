import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_retail/language/controller/event.dart';
import 'package:pharma_retail/language/controller/states.dart';

class LanguageBloc extends Bloc<LanguageBaseEvent, LanguageStates> {
  LanguageBloc() : super(const LanguageStates()) {
    on<ChooseLanguageEvent>(_chooseLanguage);
  }
  static LanguageBloc get(context) => BlocProvider.of(context);
  FutureOr<void> _chooseLanguage(event, emit) {
    emit(
      state.copyWith(
        language: event.language,
      ),
    );
  }
}
