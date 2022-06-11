import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_app/screens/home/bloc/home_bloc.dart';
import 'package:space_x_app/screens/home/components/listSpaceLaunch.dart';
import 'package:space_x_app/screens/home/components/searchBox.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (context, state){
        if (state is HomeLoadingState){
          return const Center(child: CircularProgressIndicator(),
          );
        }
        if (state is HomeLoadedState){
         return SingleChildScrollView(
           child: Column(
             children: [
               SearchBox(screenSize: screenSize),
               ListSpaceLaunch(state.listSpaceApi),

             ],
           ),
         );
        }
        return CircularProgressIndicator();
      }
      ,

    );
  }
}
