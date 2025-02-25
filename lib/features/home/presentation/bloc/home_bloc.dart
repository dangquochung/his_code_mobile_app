
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:vnpt_his/features/home/data/datasources/home_native_features.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_event.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_state.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/feature.dart';
import '../../domain/usecases/get_features.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFeatures getFeatures;
  static const platform = MethodChannel('com.vnptit.vnpt.homeclinic/webview');

  HomeBloc({
    required this.getFeatures,
  }) : super(HomeInitial()) {
    on<LoadFeaturesEvent>((event, emit) async {
      emit(HomeLoading());
      final failureOrFeatures = await getFeatures(NoParams());
      failureOrFeatures.fold((failure) => emit(HomeError(failure.message)),
          (features) {
        final List<Feature> allFeatures = [
          ...features,
          ...nativeFeatures,
        ];
        emit(HomeLoaded(allFeatures));
      });
    });

    on<OpenFeatureEvent>((event, emit) async {
      try {
        emit(NavigateToFeaturePage(event.feature));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });

    on<ReturnToHomeEvent>((event, emit) {
      if (state is HomeLoaded) {
        // Giữ nguyên features hiện tại
        emit(HomeLoaded((state as HomeLoaded).features));
      } else {
        // Nếu chưa có data thì load lại
        add(LoadFeaturesEvent());
      }
    });

    on<ClearError>((event, emit) {
      if (state is HomeError) {
        emit(HomeLoaded((state as HomeLoaded).features));
      }
    });
  }
}
