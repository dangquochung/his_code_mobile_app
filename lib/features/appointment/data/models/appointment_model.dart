import 'package:vnpt_his/features/appointment/domain/entities/appointment.dart';

class AppointmentModel extends Appointment {
  const AppointmentModel({
    required super.appointmentId,
    required super.appointmentTime,
    required super.roomNo,
    required super.patientNo,
    required super.patientName,
    required super.patientAvatarUrl,
    required super.patientPhoneNum,
  });
}
