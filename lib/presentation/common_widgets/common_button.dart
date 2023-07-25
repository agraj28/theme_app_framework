import 'package:flutter/material.dart';
import 'package:theme_architecture/presentation/widgets/super_stateless_widget.dart';

/// CommonButton
class CommonButton extends SuperStatelessWidget {
  /// callback when user tap on button
  final VoidCallback onPressed;

  /// child widget for button
  final Widget child;

  /// padding for button
  final EdgeInsetsGeometry? padding;

  /// common button constructor
  CommonButton({
    required this.onPressed,
    required this.child,
    this.padding,
  });

  /// if button contains icon
  CommonButton.icon({
    required this.onPressed,
    required Widget icon,
    required Widget label,
  })  : padding = const EdgeInsetsDirectional.only(start: 12.0, end: 16.0),
        child = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon,
            const SizedBox(width: 8.0),
            label,
          ],
        );

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: padding,
          child: child,
        ),
      );
}
