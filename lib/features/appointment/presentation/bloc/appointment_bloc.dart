import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpt_his/features/appointment/data/models/appointment_model.dart';


class AppointmentState {
  final List<AppointmentModel> listAppointments = [
    AppointmentModel(
        appointmentId: 0,
        appointmentTime: '08h30',
        roomNo: 1,
        patientNo: 123456,
        patientName: 'Nguyễn Xuân Sang',
        patientAvatarUrl:
            'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        patientPhoneNum: '0123456789'),
    AppointmentModel(
        appointmentId: 1,
        appointmentTime: '09h30',
        roomNo: 2,
        patientNo: 123457,
        patientName: 'Trịnh Thu Thảo',
        patientAvatarUrl:
            'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        patientPhoneNum: '0412566298'),
    AppointmentModel(
        appointmentId: 2,
        appointmentTime: '10h30',
        roomNo: 3,
        patientNo: 123458,
        patientName: 'Ngô Quang Hùng',
        patientAvatarUrl:
            'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        patientPhoneNum: '0412566298'),
    AppointmentModel(
        appointmentId: 3,
        appointmentTime: '11h30',
        roomNo: 4,
        patientNo: 123459,
        patientName: 'Trịnh Phương Thúy',
        patientAvatarUrl:
            'https://images.unsplash.com/photo-1554151228-14d9def656e4?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        patientPhoneNum: '0412566298'),
    AppointmentModel(
        appointmentId: 4,
        appointmentTime: '14h30',
        roomNo: 3,
        patientNo: 123461,
        patientName: 'Lê Thu Quỳnh',
        patientAvatarUrl:
            'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        patientPhoneNum: '0412566298'),
  ];
}

abstract class AppointmentEvent {}

class SampleEvent extends AppointmentEvent {
  final BuildContext context;

  SampleEvent(this.context);
}

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentState()) {
    on<SampleEvent>((event, emit) {});
  }
}
