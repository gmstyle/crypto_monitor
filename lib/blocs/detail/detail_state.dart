part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final BlocStatus status;
  final DetailData? data;
  final String? error;

  const DetailState._({
    required this.status,
    this.data,
    this.error,
  });

  const DetailState.initial() : this._(status: BlocStatus.initial);

  const DetailState.loading() : this._(status: BlocStatus.loading);

  const DetailState.loaded({required DetailData data})
      : this._(status: BlocStatus.loaded, data: data);

  const DetailState.error({required String error})
      : this._(status: BlocStatus.error, error: error);

  @override
  List<Object?> get props => [status, data, error];
}
