import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingState {
  final int chosenFeature;

  LandingState({
    this.chosenFeature = 0,
  });

  LandingState copyWith({
    int? chosenFeature,
  }) {
    return LandingState(
      chosenFeature: chosenFeature ?? this.chosenFeature,
    );
  }
}

abstract class LandingEvent {}

class ClickLogin extends LandingEvent {
  final BuildContext context;

  ClickLogin(this.context);
}

class ClickProduct extends LandingEvent {
  final BuildContext context;

  ClickProduct(this.context);
}

class ClickAboutUs extends LandingEvent {
  final BuildContext context;

  ClickAboutUs(this.context);
}

class ClickNews extends LandingEvent {
  final BuildContext context;

  ClickNews(this.context);
}

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingState()) {
    on<ClickLogin>((event, emit) {
      emit(state.copyWith(chosenFeature: 1));
    });

    on<ClickProduct>((event, emit) {
      emit(state.copyWith(chosenFeature: 2));
    });

    on<ClickAboutUs>((event, emit) {
      emit(state.copyWith(chosenFeature: 3));
    });

    on<ClickNews>((event, emit) {
      emit(state.copyWith(chosenFeature: 4));
    });
  }
}
