import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpt_his/utils/shared_pref_utils.dart';

class SettingsState extends Equatable {
  final bool availabilityEnabled;
  final bool notificationEnabled;
  final bool darkModeEnabled;

  const SettingsState({
    this.availabilityEnabled = true,
    this.notificationEnabled = true,
    this.darkModeEnabled = false,
  });

  SettingsState copyWith({
    bool? availabilityEnabled,
    bool? notificationEnabled,
    bool? darkModeEnabled,
  }) {
    return SettingsState(
      availabilityEnabled: availabilityEnabled ?? this.availabilityEnabled,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
    );
  }

  @override
  List<Object?> get props => [
        availabilityEnabled,
        notificationEnabled,
        darkModeEnabled,
      ];
}

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class GetInitialData extends SettingsEvent {
  const GetInitialData();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ToggleAvailabilityStatus extends SettingsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ToggleNotification extends SettingsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ToggleDarktMode extends SettingsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<GetInitialData>((event, emit) async {
      // Load data when the Bloc is initialized
      bool? availabilityStatus = await SharedPrefUtils.getAvailabilityStatus();
      bool? notification = await SharedPrefUtils.getNotification();
      bool? darkMode = await SharedPrefUtils.getDarkMode();

      emit(state.copyWith(
        availabilityEnabled: availabilityStatus,
        notificationEnabled: notification,
        darkModeEnabled: darkMode,
      ));
    });

    on<ToggleAvailabilityStatus>((event, emit) async {
      emit(state.copyWith(
        availabilityEnabled: !state.availabilityEnabled,
      ));

      // Save to local
      SharedPrefUtils.setAvailabilityStatus(state.availabilityEnabled);
    });

    on<ToggleNotification>((event, emit) async {
      emit(state.copyWith(
        notificationEnabled: !state.notificationEnabled,
      ));

      // Save to local
      SharedPrefUtils.setNotification(state.notificationEnabled);
    });

    on<ToggleDarktMode>((event, emit) async {
      emit(state.copyWith(
        darkModeEnabled: !state.darkModeEnabled,
      ));

      // Save to local
      SharedPrefUtils.setDarkMode(state.darkModeEnabled);
    });

    // Get Initial Data
    add(GetInitialData());
  }
}
