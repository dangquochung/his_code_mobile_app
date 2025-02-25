import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_gradient_card.dart';
import 'package:vnpt_his/features/appointment/data/models/appointment_model.dart';
import 'package:vnpt_his/gen/assets.gen.dart';
import 'package:vnpt_his/utils/date_util.dart';

class AppointmentItemWidget extends StatelessWidget {
  final AppointmentModel appointmentModel;

  const AppointmentItemWidget({
    super.key,
    required this.appointmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: appointmentModel.patientAvatarUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: Theme.of(context).primaryColor,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${appointmentModel.patientNo} - ${appointmentModel.patientName}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(Assets.images.common.icPhone),
                    const SizedBox(width: 4),
                    Text(
                      appointmentModel.patientPhoneNum,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                BaseGradientCard(
                    childWidget: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${appointmentModel.appointmentTime} - ${AppLocale.clinic.getString(context)} ${appointmentModel.roomNo}",
                            style: TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            DateUtil.dateTimeToDayMonthYear(context),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
