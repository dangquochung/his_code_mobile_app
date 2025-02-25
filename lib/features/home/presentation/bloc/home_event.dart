import 'package:equatable/equatable.dart';
import '../../domain/entities/feature.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadFeaturesEvent extends HomeEvent {}

class ClearError extends HomeEvent {}

class ReturnToHomeEvent extends HomeEvent {}

class OpenFeatureEvent extends HomeEvent {
  final Feature feature;

  OpenFeatureEvent(this.feature);

  @override
  List<Object> get props => [feature];
}