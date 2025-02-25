import 'package:equatable/equatable.dart';
import '../../domain/entities/feature.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Feature> features;

  HomeLoaded(this.features);

  @override
  List<Object> get props => [features];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object> get props => [message];
}

class NavigateToFeaturePage extends HomeState {
  final Feature feature;

  NavigateToFeaturePage(this.feature);

  @override
  List<Object> get props => [feature];
}