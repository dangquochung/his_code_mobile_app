import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_dimens.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_border_text_field.dart';
import 'package:vnpt_his/utils/string_util.dart';

class CustomerServiceDialog extends StatefulWidget {
  const CustomerServiceDialog({super.key});

  @override
  State<CustomerServiceDialog> createState() => _CustomerServiceDialogState();
}

class _CustomerServiceDialogState extends State<CustomerServiceDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  String _getValidatingMessage(String field) {
    return "${AppLocale.pleaseEnter.getString(context)} ${field.toLowerCase()}";
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _getValidatingMessage(AppLocale.fullName.getString(context));
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _getValidatingMessage(AppLocale.phoneNumber.getString(context));
    }
    // Add more phone number validation logic here if needed
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _getValidatingMessage(AppLocale.email.getString(context));
    }
    // Basic email validation
    if (!StringUtil.validateEmail(value.trim())) {
      return AppLocale.invalidEmailWarning.getString(context);
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _getValidatingMessage(AppLocale.address.getString(context));
    }
    return null;
  }

  String? _validateContent(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _getValidatingMessage(AppLocale.content.getString(context));
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Address: ${_addressController.text}');
      print('Content: ${_contentController.text}');
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppDimens.horizontalPadding,
      ),
      title: Text(
        AppLocale.sendInfo.getString(context),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(),
                BaseBorderTextField(
                  controller: _nameController,
                  label: AppLocale.fullName.getString(context),
                  validator: _validateName,
                ),
                BaseBorderTextField(
                  controller: _phoneController,
                  label: AppLocale.phoneNumber.getString(context),
                  validator: _validatePhoneNumber,
                  inputType: TextInputType.phone,
                ),
                BaseBorderTextField(
                  controller: _emailController,
                  label: AppLocale.email.getString(context),
                  validator: _validateEmail,
                ),
                BaseBorderTextField(
                  controller: _addressController,
                  label: AppLocale.address.getString(context),
                  validator: _validateAddress,
                ),
                BaseBorderTextField(
                  controller: _contentController,
                  label: AppLocale.content.getString(context),
                  validator: _validateContent,
                  maxLines: 5,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppLocale.cancel.getString(context),
          ),
        ),
        TextButton(
          onPressed: _submitForm,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            AppLocale.send.getString(context),
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
