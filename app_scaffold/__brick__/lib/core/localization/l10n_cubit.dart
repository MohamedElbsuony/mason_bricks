import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class L10nCubit extends Cubit<Locale> {
  L10nCubit() : super(const Locale('en'));

  void changeLanguage(String languageCode) {
    emit(Locale(languageCode));
  }
}
