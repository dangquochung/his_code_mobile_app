import 'package:flutter/material.dart';

class BaseBorderTextField extends StatelessWidget {
  final String label;
  final String? value;
  final bool readOnly;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final double height;
  final int maxLines;
  final TextInputType? inputType;

  const BaseBorderTextField({
    super.key,
    required this.label,
    this.value,
    this.readOnly = false,
    this.controller,
    this.onTap,
    this.validator,
    this.height = 56.0,
    this.maxLines = 1,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        maxLines: maxLines,
        keyboardType: inputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: (height - 24) / 2,
          ),
          labelText: label,
          floatingLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
