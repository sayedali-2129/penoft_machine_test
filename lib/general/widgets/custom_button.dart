import 'package:flutter/material.dart';

//Colored Button
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonColor,
    required this.buttonWidget,
    this.onPressed,
    this.borderRadius,
    this.elevation,
  });
  final double? buttonHeight;
  final double? buttonWidth;
  final Color buttonColor;
  final Widget buttonWidget;
  final double? borderRadius;
  final double? elevation;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(elevation ?? 2),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
          ),
        ),
        child: buttonWidget,
      ),
    );
  }
}

//Outline Button
class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonColor,
    this.onPressed,
    required this.borderColor,
    required this.buttonWidget,
    this.borderRadius,
    this.elevetion,
  });

  final double? buttonHeight;
  final double? buttonWidth;
  final Color buttonColor;
  final double? borderRadius;

  final Color borderColor;
  final void Function()? onPressed;
  final Widget buttonWidget;
  final double? elevetion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(elevetion ?? 0),
          shadowColor: const WidgetStatePropertyAll(Colors.black26),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
          ),
          side: WidgetStatePropertyAll(BorderSide(color: borderColor)),
        ),
        child: Center(child: buttonWidget),
      ),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonColors,
    required this.buttonWidget,
    this.onPressed,
    this.borderRadius,
    this.elevation,
  });
  final double? buttonHeight;
  final double? buttonWidth;
  final List<Color> buttonColors;
  final Widget buttonWidget;
  final double? borderRadius;
  final double? elevation;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: buttonColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(child: buttonWidget),
          ),
        ),
      ),
    );
  }
}
