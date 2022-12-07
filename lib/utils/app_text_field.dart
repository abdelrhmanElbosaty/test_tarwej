import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final bool? useHint;
  final double verticalContentPadding;
  final double horizontalContentPadding;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function? onSubmit;
  final Function? onChange;
  final Function? onTap;
  final bool? isPassword;
  final bool? showKeyboard;
  final String? Function(String?)? validate;
  final String? labelName;
  final double? borderRadius;
  final IconData? prefix;
  final IconData? suffix;
  final IconButton? suffixIconButton;
  final int? minLine;
  final int? maxLine;

  const AppTextFormField(
      {super.key,
      required this.verticalContentPadding,
      required this.horizontalContentPadding,
      required this.controller,
      required this.keyboardType,
      this.useHint,
      this.onSubmit,
      this.onChange,
      this.onTap,
      this.validate,
      this.borderRadius,
      this.isPassword,
      this.showKeyboard,
      this.labelName,
      this.prefix,
      this.suffix,
      this.suffixIconButton,
      this.minLine,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: (value) {
        if (onSubmit != null) {
          onSubmit!();
        }
      },
      onChanged: (value) {
        if (onChange != null) {
          onChange!();
        }
      },
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      obscureText: isPassword?? false,
      validator: validate,
      maxLines: maxLine ?? 1,
      minLines: minLine ?? 1,

      decoration: InputDecoration(
        hintText: (useHint?? false) ? labelName : null,
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalContentPadding,
            horizontal: horizontalContentPadding),
        labelText: (useHint?? false) ? null : labelName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null
            ? (suffixIconButton ?? Icon(suffix))
            : (suffixIconButton),
      ),
      readOnly: !(showKeyboard ?? true),
    );
  }

  static Widget textForm(TextEditingController controller, TextInputType keyboardType,
      {IconButton? suffix, bool? isPassword, String? Function(String?)? validate}) {
    return AppTextFormField(
      isPassword: isPassword,
      borderRadius: 8,
      controller: controller,
      horizontalContentPadding: 16,
      verticalContentPadding: 16,
      keyboardType: keyboardType,
      validate: validate,
      suffixIconButton: suffix,
    );
  }
}
