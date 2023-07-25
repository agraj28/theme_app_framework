import 'package:flutter/material.dart';

/// Common Page view model
class CommonPageViewModel {
  /// Total number of pages that will be visible
  final int totalPageCount;

  /// Callback when page is changed
  final Function(int index)? pageChangeCallback;

  /// [isTabBarAtTop] will handle the position of the tab bar.
  ///
  /// if it is true tab bar will display at the top else at the bottom.
  final bool isTabBarAtTop;

  /// Provide the widget for respective page according to the index
  final Widget Function({
    required BuildContext context,
    required int pageIndex,
  }) pageWidget;

  /// Provide the widget for respective page tab according to the index and
  /// active status
  final Widget Function({
    required int pageIndex,
    required bool isActive,
  }) tabBarWidget;

  /// page view controller
  final PageController? pageController;

  /// initial page index which will active initially
  final int initialPageIndex;

  /// Common Page view model
  CommonPageViewModel({
    required this.pageWidget,
    required this.tabBarWidget,
    required this.totalPageCount,
    this.pageChangeCallback,
    this.isTabBarAtTop = true,
    this.pageController,
    this.initialPageIndex = 0,
  });
}
