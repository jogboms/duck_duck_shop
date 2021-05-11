import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.height,
    this.minWidth,
    this.heroTag,
    this.margin = EdgeInsets.zero,
    this.color = Colors.white,
    this.backgroundColor = Colors.blue,
    this.shape,
  }) : super(key: key);

  final Color color;
  final Color backgroundColor;
  final Widget child;
  final EdgeInsets margin;
  final double height;
  final double minWidth;
  final String heroTag;
  final VoidCallback onPressed;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = ButtonTheme.of(context);
    final button = TextButton(
      style: TextButton.styleFrom(
        primary: color,
        minimumSize: Size(minWidth ?? buttonTheme.minWidth, height ?? buttonTheme.height),
        backgroundColor: onPressed != null ? backgroundColor : backgroundColor.withOpacity(.75),
        shape: shape,
      ),
      onPressed: onPressed,
      child: child,
    );
    return Padding(
      padding: margin,
      child: heroTag != null ? Hero(tag: heroTag, child: button) : button,
    );
  }
}
