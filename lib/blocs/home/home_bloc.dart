import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/ui/assetUI.dart';
import '../../repositories/home_repository.dart';
import '../bloc_status_enum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(const HomeState.initial()) {
    on<LoadAssets>((event, emit) async {
      await _onLoadAssets(event, emit);
    });
  }

  Future<void> _onLoadAssets(LoadAssets event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    try {
      final assetsUI = await homeRepository.getAssets(event.key);
      emit(HomeState.loaded(assetsUI: assetsUI));
    } catch (e) {
      emit(HomeState.error(error: e.toString()));
    }
  }
}
