import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;


  InternetBloc() : super(InternetInitialState()) {

    on<InternetLostEvent>((event, emit) => emit(InternetLostState())); // It will check which event is came or which event not

    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {   // Listener of internet connectivity
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        add(InternetGainedEvent()); // add event
      }else{
        add(InternetLostEvent());  // add event
      }
    });

  }

  @override
  Future<void> close(){
    connectivitySubscription?.cancel();
    return super.close();
  }// it will initilize the bloc like stateless widget we need to give initial state
}