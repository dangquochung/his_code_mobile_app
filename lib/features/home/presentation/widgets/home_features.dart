import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnpt_his/features/home/presentation/bloc/home_event.dart';
import '../../domain/entities/feature.dart';
import '../bloc/home_bloc.dart';

class FeatureItem extends StatelessWidget {
  final Feature feature;

  const FeatureItem({Key? key, required this.feature}) : super(key: key);

  Widget _buildIcon() {
    // Nếu iconUrl bắt đầu với "http", ta dùng SvgPicture.network
    if (feature.iconUrl.startsWith('http')) {
      return SvgPicture.network(
        feature.iconUrl,
        width: 24,
        height: 24,
      );
    } else {
      // Nếu không, dùng SvgPicture.asset cho assets
      return SvgPicture.asset(
        feature.iconUrl,
        width: 24,
        height: 24,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(OpenFeatureEvent(feature));
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: _buildIcon(),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                feature.title,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 99, 203, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
