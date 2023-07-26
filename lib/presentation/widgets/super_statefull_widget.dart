import 'package:flutter/material.dart';
import 'package:theme_app_framework/core_utils/screen_util.dart';

class SuperStatefulWidget<T> extends StatefulWidget {
  final T? dataModel;

  const SuperStatefulWidget({
    this.dataModel,
    Key? key,
  }) : super(key: key);

  @override
  SuperStatefulWidgetState createState() => SuperStatefulWidgetState();
}

class SuperStatefulWidgetState extends State<SuperStatefulWidget>
    with SingleTickerProviderStateMixin {
  /// Screen util instance for resizing widgets and screen
  /// related configurations
  ScreenUtil? screenUtil;

  @override
  void initState() {
    screenUtil = ScreenUtil();
    initialize();
    syncData();
    super.initState();
  }

  Future<void> syncData() async {}

  Future<void> initialize() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (screenUtil?.isTablet ?? false) {
      return buildTabletApp(context, screenUtil);
    } else {
      return buildMobileApp(context, screenUtil);
    }
  }

  /// override this method for mobile view if app view is same in both
  /// landscape and portrait mode
  Widget buildMobileApp(BuildContext context, ScreenUtil? screenUtil) =>
      (screenUtil?.isPortraitMode(context) ?? true)
          ? buildMobileAppInPortraitMode(context, screenUtil)
          : buildMobileAppInLandscapeMode(context, screenUtil);

  /// override this method for tablet view
  Widget buildTabletApp(BuildContext context, ScreenUtil? screenUtil) =>
      SizedBox.shrink();

  /// override this method for mobile view in portrait mode
  Widget buildMobileAppInPortraitMode(
    BuildContext context,
    ScreenUtil? screenUtil,
  ) =>
      SizedBox.shrink();

  /// override this method for mobile view in landscape mode
  Widget buildMobileAppInLandscapeMode(
    BuildContext context,
    ScreenUtil? screenUtil,
  ) =>
      SizedBox.shrink();
}
