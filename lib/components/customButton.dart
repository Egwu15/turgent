import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double height;
  final Color bgColor;
  final TextStyle labelStyle;
  final double width;
  final Function onTap;
  CustomButton(
      {this.label,
      this.padding,
      this.height,
      this.bgColor,
      this.labelStyle,
      this.width,
      this.onTap,
      this.margin});
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.onTap ?? null,
      child: Container(
        margin:
            widget.margin ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: widget.padding ?? EdgeInsets.all(8),
        height: widget.height ?? 60,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.bgColor ?? Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            widget.label,
            style: widget.labelStyle ?? theme.textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}
