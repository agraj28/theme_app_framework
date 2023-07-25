import 'package:flutter/material.dart';
import 'package:theme_architecture/core_utils/screen_util.dart';
import 'package:theme_architecture/presentation/widgets/super_statefull_widget.dart';

class Signup extends SuperStatefulWidget {
   Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends SuperStatefulWidgetState {
  @override
  Widget buildMobileApp(BuildContext context, ScreenUtil? screenUtil) =>
      SizedBox.shrink();

  @override
  Widget buildTabletApp(BuildContext context, ScreenUtil? screenUtil) =>
      SizedBox.shrink();
}
