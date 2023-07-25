import 'package:flutter/material.dart';
import 'package:theme_architecture/core_utils/screen_util.dart';
import 'package:theme_architecture/presentation/common_widgets/common_tab_bar/entity/common_tab_bar_model.dart';
import 'package:theme_architecture/presentation/widgets/super_stateless_widget.dart';

import 'tab_bar_item.dart';

/// Common Tab bar
class CommonTabBar extends SuperStatelessWidget {
  /// index of the tab that will be active initially
  final int initiallyActiveTabIndex;

  /// callback when tab is changed
  final Function(int index)? onTabChange;

  /// list of tabs available in tab bar
  final List<CommonTabBarModel> tabBarList;

  /// Padding around the tab bar, initial value is EdgeInsects.all(10.toHeight)
  final EdgeInsetsGeometry? padding;

  /// Notifier which will update the ui when tab is changed
  final ValueNotifier<int>? tabChangeNotifier ;

  /// vertical space between icon and text
  final double spaceBetween;

  /// text style when tab is not active
  final TextStyle? inActiveTitleTextStyle;

  /// text style when tab is active
  final TextStyle? activeTitleTextStyle;

  /// Common Tab bar constructor
  CommonTabBar({
    required this.onTabChange,
    required this.tabBarList,
    this.padding,
    this.initiallyActiveTabIndex = 0,
    this.spaceBetween = 10,
    this.activeTitleTextStyle,
    this.inActiveTitleTextStyle,
    this.tabChangeNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   var tabNotifier =  tabChangeNotifier ?? ValueNotifier(initiallyActiveTabIndex);
    return ValueListenableBuilder(
      valueListenable: tabNotifier,
      builder: (context, value, child) => Padding(
        padding: padding ?? EdgeInsets.all(10.toHeight),
        child: Row(
          children: [
            for (int index = 0; index < tabBarList.length; index++)
              TabBarItem(
                tabBarItem: tabBarList[index],
                isActive: index == value,
                tabIndex: index,
                tabChangeNotifier: tabNotifier,
                onTabChange: onTabChange,
                spaceBetween: spaceBetween,
                textStyle: index == value
                    ? activeTitleTextStyle
                    : inActiveTitleTextStyle,
              ),
          ],
        ),
      ),
    );
  }
}




