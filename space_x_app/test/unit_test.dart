import 'dart:core';

import 'package:flutter_test/flutter_test.dart';
import 'package:space_x_app/repository/SpaceX.dart';


void main(){

  final SpaceXSeviceApi api;
  test("Deve retornar uma lista quando sucesso no request", () async {

    final list = await SpaceXSeviceApi().getFlySpaceActivity();
    expect( list, isNotEmpty);

  });
}