import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';

Widget buildSearchBar(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: AppLocale.search.getString(context),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.blue[600],
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }