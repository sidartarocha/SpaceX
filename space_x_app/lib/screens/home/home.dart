import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:space_x_app/repository/ConnectivityService.dart';
import 'package:space_x_app/repository/SpaceX.dart';

import '../../util/constants.dart';
import 'bloc/home_bloc.dart';
import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MultiBlocProvider(
        providers:[
          BlocProvider(
              create: (context) => HomeBloc(
                SpaceXSeviceApi(),
              )..add(HomeLoadEvent())
          ),
        ], child:  const HomeBody(),
      ),

      // body: BlocProvider<HomeBloc>(
      //   create: (BuildContext context) => HomeBloc(HomeLoadingState())..add(HomeLoadList()),
      //   child: HomeBody(),
      // )
      //HomeBody(),
      //bottomNavigationBar: HomeBottomNagivationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text('SpaceXapp'.i18n(),style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
      ),
    );

    /*leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {}
        ),
      );*/
  }
}
