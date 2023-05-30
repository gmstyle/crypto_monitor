part of 'home_bloc.dart';

class HomeState extends Equatable {
  final BlocStatus status;
  final List<Asset> assetsUI;
  final String? error;
  const HomeState._({
    required this.status,
    this.assetsUI = const [],
    this.error,
  });

  const HomeState.initial() : this._(status: BlocStatus.initial);

  const HomeState.loading() : this._(status: BlocStatus.loading);

  const HomeState.loaded({required List<Asset> assetsUI})
      : this._(status: BlocStatus.loaded, assetsUI: assetsUI);

  const HomeState.error({required String error})
      : this._(status: BlocStatus.error, error: error);

  @override
  List<Object?> get props => [status, assetsUI, error];
}

/*class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class AssetsLoading extends HomeState {
  const AssetsLoading();

  @override
  List<Object> get props => [];
}

class AssetsLoaded extends HomeState {
  const AssetsLoaded({required this.assetsUI});

  final List<AssetUI> assetsUI;

  @override
  List<Object> get props => [assetsUI];
}

class AssetsError extends HomeState {
  const AssetsError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}*/
