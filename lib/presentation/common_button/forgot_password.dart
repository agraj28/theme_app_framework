import 'package:flutter/material.dart';
import 'package:theme_app_framework/presentation/widgets/super_statefull_widget.dart';

class ForgotPassword extends SuperStatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends SuperStatefulWidgetState {

  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}