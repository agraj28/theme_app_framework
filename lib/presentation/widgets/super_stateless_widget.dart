import 'package:flutter/material.dart';
import 'package:theme_app_framework/core_utils/screen_util.dart';

/// Super state less widget
class SuperStatelessWidget extends StatelessWidget {
  /// Super state less widget constructor
  const SuperStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [screenUtil] instance for resizing widgets and screen related
    /// configurations
    var screenUtil = ScreenUtil();
    if (screenUtil.isTablet) {
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
