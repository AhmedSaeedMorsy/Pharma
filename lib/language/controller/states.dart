import 'package:equatable/equatable.dart';

import '../../app/constant/enums_extentions.dart';

class LanguageStates extends Equatable {
  final LanguageEnum language;
  const LanguageStates({
    this.language = LanguageEnum.english,
  });
  LanguageStates copyWith({LanguageEnum? language}) => LanguageStates(
        language: language ?? this.language,
      );
  @override
  List<Object?> get props => [
        language,
      ];
}
