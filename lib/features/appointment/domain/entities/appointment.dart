import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final int appointmentId;
  final String appointmentTime;
  final int roomNo;
  final int patientNo;
  final String patientName;
  final String patientAvatarUrl;
  final String patientPhoneNum;

  const Appointment({
    required this.appointmentId,
    required this.appointmentTime,
    required this.roomNo,
    required this.patientNo,
    required this.patientName,
    required this.patientAvatarUrl,
    required this.patientPhoneNum,
  });

  @override
  List<Object> get props => [
        appointmentId,
        appointmentTime,
        roomNo,
        patientNo,
        patientAvatarUrl,
        patientPhoneNum
      ];
}
