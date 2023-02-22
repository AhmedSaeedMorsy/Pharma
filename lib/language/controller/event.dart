import 'package:equatable/equatable.dart';

import '../../app/constant/enums_extentions.dart';

abstract class LanguageBaseEvent extends Equatable {}

class ChooseLanguageEvent extends LanguageBaseEvent {
  final LanguageEnum language;
  ChooseLanguageEvent(this.language);
  @override
  List<Object?> get props => [
        language,
      ];
}
