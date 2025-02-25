import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? value;
  final bool readOnly;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final double height; 

  const CustomTextField({
    Key? key,
    required this.label,
    this.value,
    this.readOnly = false,
    this.controller,
    this.onTap,
    this.validator,
    this.height = 56.0, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: (height - 24) / 2, // Tính toán khoảng cách padding dọc
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(193, 193, 193, 1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(193, 193, 193, 1)),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
