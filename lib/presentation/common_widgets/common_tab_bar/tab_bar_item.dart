import 'package:flutter/material.dart';
import 'package:theme_architecture/core_utils/screen_util.dart';
import 'package:theme_architecture/presentation/widgets/super_stateless_widget.dart';

import 'entity/common_tab_bar_model.dart';

/// tab bar item for a particular tab in tab bar
class TabBarItem extends SuperStatelessWidget {
  /// Keep the status of current tab
  final bool isActive;

  /// keep the properties of tab bar item
  final CommonTabBarModel tabBarItem;

  /// Position of itself in the tab bar
  final int tabIndex;

  /// tab change notifier will update the UI when tab is changed
  final ValueNotifier tabChangeNotifier;

  /// callback when user click on any tab
  final Function(int index)? onTabChange;

  /// If icon and title both are provided then it will handle the vertical space
  /// between icon and title
  final double spaceBetween;

  /// title text style
  final TextStyle? textStyle;

  /// Tab bar item constructor
  const TabBarItem({
    required this.isActive,
    required this.tabBarItem,
    required this.tabIndex,
    required this.tabChangeNotifier,
    required this.spaceBetween,
    this.textStyle,
    this.onTabChange,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: GestureDetector(
          onTap: () {
            tabChangeNotifier.value = tabIndex;
            if (onTabChange != null) {
              onTabChange!(tabIndex);
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.toWidth),
            padding: EdgeInsets.only(bottom: 5.toHeight),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: isActive ? Colors.blue : Colors.transparent,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isActive && tabBarItem.activeIcon != null)
                  tabBarItem.activeIcon!,
                if (!isActive && tabBarItem.inActiveIcon != null)
                  tabBarItem.inActiveIcon!,
                if ((tabBarItem.activeIcon != null ||
                        tabBarItem.inActiveIcon != null) &&
                    tabBarItem.tabTitle.trim().isNotEmpty)
                  SizedBox(height: spaceBetween),
                Text(
                  tabBarItem.tabTitle,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
}
