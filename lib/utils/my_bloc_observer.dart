import 'dart:developer';

import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
}
