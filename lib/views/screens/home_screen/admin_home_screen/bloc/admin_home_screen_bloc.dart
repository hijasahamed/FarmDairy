// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:farm_dairy/controllers/admin_home_screen_controllers.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'admin_home_screen_event.dart';
part 'admin_home_screen_state.dart';

class AdminHomeScreenBloc extends Bloc<AdminHomeScreenEvent, AdminHomeScreenState> {
  AdminHomeScreenBloc() : super(AdminHomeScreenInitial()) {
    on<AdminHomeScreenEvent>((event, emit) {
      
    });
    on<AddSalesManRefreshEvent>(addSalesManRefreshEvent);
    on<AddSalesManStopRefreshEvent>(addSalesManStopRefreshEvent);
  }

  FutureOr<void> addSalesManRefreshEvent(
    AddSalesManRefreshEvent event, Emitter<AdminHomeScreenState> emit) {
      emit(AddSalesManRefreshState());
  }

  FutureOr<void> addSalesManStopRefreshEvent(
    AddSalesManStopRefreshEvent event, Emitter<AdminHomeScreenState> emit) {
      emit(AddSalesManStopRefreshState());
  }
}



enum DeleteSalesManState { initial, loading, success, error }

class DeleteSalesManCubit extends Cubit<DeleteSalesManState> {
  DeleteSalesManCubit() : super(DeleteSalesManState.initial);

  Future<void> deleteSalesManBloc(String documentId, BuildContext context) async {
    try {
      emit(DeleteSalesManState.loading);
      await Future.delayed(const Duration(seconds: 2));
      await deleteSalesMan(documentId: documentId, context: context).then((value) {
        if(value==true){
          Navigator.of(context).pop();
        }
      },);
      emit(DeleteSalesManState.success);
    } catch (e) {
      emit(DeleteSalesManState.error);
    }
  }
}