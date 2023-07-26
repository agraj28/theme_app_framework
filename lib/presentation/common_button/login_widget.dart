import 'package:flutter/material.dart';
import 'package:theme_app_framework/core_utils/screen_util.dart';
import 'package:theme_app_framework/presentation/widgets/super_statefull_widget.dart';

class LoginPage extends SuperStatefulWidget {
   LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends SuperStatefulWidgetState {
  @override
  Future<void> syncData() => super.syncData();

  @override
  Widget buildMobileApp(BuildContext context, ScreenUtil? screenUtil) =>
      SizedBox.shrink();

  @override
  Widget buildTabletApp(BuildContext context, ScreenUtil? screenUtil) =>
      SizedBox.shrink();
}
