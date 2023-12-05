import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double fontsize;
  final double? width;
  final EdgeInsets pad;
  final double borderRadius;
  final double? elevation;
  final FontWeight fontWeight;
  final Color fontColor;
  final Color backgroundColor;
  final Color borderColor;
  final bool enableBorder;
  final bool isLoading;
  final Widget? widget;
  final TextStyle? fontStyle;
  final Color overlayColor;
  const CustomizedButton({
    Key? key,
    required this.onTap,
    this.text = '',
    this.pad = EdgeInsets.zero,
    this.fontsize = 14,
    this.fontWeight = FontWeight.w500,
    this.fontColor = Colors.white,
    this.backgroundColor = Colors.orange,
    this.borderRadius = 5,
    this.width,
    this.enableBorder = false,
    this.borderColor = Colors.black,
    this.isLoading = false,
    this.widget,
    this.elevation,
    this.fontStyle,
    this.overlayColor = Colors.black12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(overlayColor),
        padding: MaterialStatePropertyAll(pad),
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: enableBorder
                  ? BorderSide(color: borderColor)
                  : BorderSide.none),
        ),
      ),
      child: isLoading
          ? Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3),
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : widget ??
              Container(
                width: width,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: fontStyle ??
                      TextStyle(
                          color: fontColor,
                          fontSize: fontsize,
                          fontWeight: fontWeight),
                ),
              ),
    );
  }
}
