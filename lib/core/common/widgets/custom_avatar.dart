import 'package:flutter/material.dart';

Widget customAvatar() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          color: Colors.blue,
          size: 24,
        ),
      ),
    );
  }