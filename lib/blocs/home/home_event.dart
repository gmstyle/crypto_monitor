part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadAssets extends HomeEvent {
  final String? key;
  const LoadAssets(this.key);

  @override
  List<Object?> get props => [key];
}
