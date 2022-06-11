import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_x_app/repository/SpaceX.dart';



part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final SpaceXSeviceApi spaceXSeviceApi ;

  HomeBloc( this.spaceXSeviceApi ) : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeLoadEvent){
        emit(HomeLoadingState());
        List<SpaceXServiceApi> apiResult = (await spaceXSeviceApi.getListFlySpaceActivity()) ;
        if (apiResult.isEmpty ){
          emit(HomeErrorState());
        }else{
          emit(HomeLoadedState( listSpaceApi: apiResult));
        }
      }
    });
  }
}
