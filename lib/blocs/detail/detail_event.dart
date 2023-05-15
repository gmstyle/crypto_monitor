part of 'detail_bloc.dart';

enum HistoryInterval { d1, h1, h2, h6, h12, m1, m5, m15, m30 }

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class LoadDetail extends DetailEvent {
  final String id;
  final HistoryInterval interval;

  const LoadDetail({required this.id, required this.interval});

  @override
  List<Object> get props => [id, interval];
}
