// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:benmore/core/constants/app_strings.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final String label;
  final Color? backgroundColor;
  final VoidCallback function;
  final Color? textColor;
  final bool isClicked;
  final bool isError;
  final dynamic icon;
  final double height;

  const CustomIconButton(
      {Key? key,
      this.textColor,
      this.backgroundColor,
      required this.label,
      required this.function,
      this.isClicked = false,
      this.isError = true,
      this.icon,
      this.height = 58.0})
      : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;
    return Container(
      width: isTablet ? 275 : 175.0,
      height: isTablet ? 100 : widget.height,
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: () {
            if (!widget.isError) {
              widget.function();
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: widget.backgroundColor != null
                ? widget.backgroundColor
                : widget.isError
                    ? BrandColors.grey6
                    : Color(0xFFFF7D3F),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(isTablet ? 96.0 : 48.0), // <-- Radius
            ),
            // Background color
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.icon,
              const SizedBox(width: 13),
              AutoSizeText(
                widget.label,
                style: TextStyle(
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    color: widget.textColor != null
                        ? widget.textColor
                        : Colors.white,
                    fontSize: isTablet ? 32 : 16),
                maxFontSize: isTablet ? 32 : 16,
              )
            ],
          )),
    );
  }
}
