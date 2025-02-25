import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_app_bar.dart';
import 'package:vnpt_his/features/appointment/presentation/widgets/appointment_item_widget.dart';
import '../bloc/appointment_bloc.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppointmentBloc(),
      child: Scaffold(
        appBar: BaseAppBar(
          title: AppLocale.todayAppointment.getString(context),
          needBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: BlocBuilder<AppointmentBloc, AppointmentState>(
              builder: (context, state) {
            return ListView.builder(
                itemCount: state.listAppointments.length,
                itemBuilder: (BuildContext context, int index) {
                  return AppointmentItemWidget(
                      appointmentModel: state.listAppointments[index]);
                });
          }),
        ),
      ),
    );
  }
}
