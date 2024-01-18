import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_m/main.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tabs_event.dart';
part 'tabs_state.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(const TabsStateUnitialized(user: null)) {
    on<Fetch>(fetch);

    add(Fetch());
  }

  Future<void> fetch(TabsEvent event, Emitter<TabsState> emit) async {
    final dio = Dio();

    try {
      final res = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
      log('$res');
    } catch (error) {
      log('err', error: error);
      emit(TabsStateError(user: null, errorMessage: error.toString()));
    }
  }
}
