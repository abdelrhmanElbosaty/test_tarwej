import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final Function function;
  final String title;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? borderRadius;

  const AppButton({
    required this.function,
    required this.title,
    this.buttonColor,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.borderRadius
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize ?? 24, fontWeight: fontWeight ?? FontWeight.bold, color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
