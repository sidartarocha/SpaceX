part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  //final SpaceXActivity spaceXActivity;

  final List<SpaceXServiceApi> listSpaceApi;
  const HomeLoadedState({
    required this.listSpaceApi,
  });
}

class HomeErrorState extends HomeState {}
