import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_monitor/blocs/bloc_status_enum.dart';
import 'package:crypto_monitor/models/ui/detail_dataUI.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/detail_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository detailRepository;
  DetailBloc({required this.detailRepository})
      : super(const DetailState.initial()) {
    on<LoadDetail>((event, emit) async {
      await _onLoadDetail(event, emit);
    });
  }

  Future<void> _onLoadDetail(
      LoadDetail event, Emitter<DetailState> emit) async {
    emit(const DetailState.loading());
    try {
      final data =
          await detailRepository.getDetailDataById(event.id, event.interval);
      emit(DetailState.loaded(data: data));
    } catch (e) {
      emit(DetailState.error(error: e.toString()));
    }
  }
}
