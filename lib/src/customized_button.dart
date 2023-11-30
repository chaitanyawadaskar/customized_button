import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double fontsize;
  final double? width;
  final double pad;
  final double borderRadius;
  final FontWeight fontWeight;
  final Color fontColor;
  final Color backgroundColor;
  final Color borderColor;
  final bool enableBorder;
  final bool isLoading;
  final Widget? widget;
  const CustomizedButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.pad = 10,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ButtonStyle(
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
          : Container(
              width: width,
              alignment: Alignment.center,
              padding: EdgeInsets.all(pad),
              child: widget ??
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: fontColor,
                        fontSize: fontsize,
                        fontWeight: fontWeight),
                  ),
            ),
    );
  }
}
