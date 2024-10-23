import 'package:flutter/material.dart';
import 'package:hackhthon_project/components/custom_text.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isTransparent;
  final bool isEnabled;
  final Color? bgColor;
  final Color textColor;
  final Widget? icon;
  final double fontSize;
  final bool isLoading;
  final double horizontalPadding;
  final double vertcalPaddingM;

  CommonButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isTransparent = false,
    this.bgColor,
    this.textColor = Colors.white,
    this.icon,
    this.horizontalPadding = 0,
    this.vertcalPaddingM = 10,
    this.fontSize = 15,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || !isEnabled ? null : onPressed,
      child: Container(
        width: horizontalPadding > 0 ? null : double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: vertcalPaddingM,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          // Check if a background color is provided, otherwise use a default gradient
          color: bgColor != null && !isTransparent ? bgColor : null,
          gradient: (bgColor == null && !isTransparent)
              ? const LinearGradient(
                  colors: [Color(0xff392776), Color.fromARGB(255, 8, 51, 143)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  width: 21,
                  height: 21,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 20),
                  ],
                  CustomText(
                    text: title,
                    fontSize: fontSize,
                    color: isTransparent ? null : textColor,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
      ),
    );
  }
}
