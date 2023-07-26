import 'package:flutter/material.dart';
import 'package:theme_app_framework/presentation/common_widgets/common_page_view/entity/common_page_view_model.dart';
import 'package:theme_app_framework/presentation/common_widgets/common_tab_bar/common_tab_bar.dart';
import 'package:theme_app_framework/presentation/common_widgets/common_tab_bar/entity/common_tab_bar_model.dart';
import 'package:theme_app_framework/presentation/widgets/super_statefull_widget.dart';

/// Common Page View
class CommonPageView extends SuperStatefulWidget<CommonPageViewModel> {
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

  /// Common Page View Constructor
  CommonPageView({
    required this.pageWidget,
    required this.tabBarWidget,
    required this.totalPageCount,
    this.pageChangeCallback,
    this.isTabBarAtTop = true,
    this.pageController,
    this.initialPageIndex = 0,
    Key? key,
  }) : super(
          dataModel: CommonPageViewModel(
            pageWidget: pageWidget,
            tabBarWidget: tabBarWidget,
            totalPageCount: totalPageCount,
            isTabBarAtTop: isTabBarAtTop,
            pageChangeCallback: pageChangeCallback,
            pageController: pageController,
            initialPageIndex: initialPageIndex,
          ),
          key: key,
        );

  @override
  _CommonPageViewState createState() => _CommonPageViewState();
}

class _CommonPageViewState extends SuperStatefulWidgetState {
  final ValueNotifier<int> _tabNotifier = ValueNotifier(0);

  late PageController _pageController;

  @override
  void initState() {
    _tabNotifier.value = widget.dataModel.initialPageIndex;
    _pageController = widget.dataModel.pageController ??
        PageController(initialPage: widget.dataModel.initialPageIndex);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _pageController.jumpToPage(_tabNotifier.value);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.dataModel.isTabBarAtTop)
            CommonTabBar(
              onTabChange: (int pageIndex) {
                if (widget.dataModel.pageChangeCallback != null) {
                  widget.dataModel.pageChangeCallback!(pageIndex);
                }
                _pageController.jumpToPage(pageIndex);
              },
              tabChangeNotifier: _tabNotifier,
              tabBarList: [
                for (int tabIndex = 0;
                    tabIndex < widget.dataModel.totalPageCount;
                    tabIndex++)
                  CommonTabBarModel(
                    activeIcon: widget.dataModel.tabBarWidget(
                      pageIndex: tabIndex,
                      isActive: true,
                    ),
                    inActiveIcon: widget.dataModel.tabBarWidget(
                      pageIndex: tabIndex,
                      isActive: false,
                    ),
                  ),
              ],
            ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int pageIndex) {
                if (widget.dataModel.pageChangeCallback != null) {
                  widget.dataModel.pageChangeCallback!(pageIndex);
                }
                _tabNotifier.value = pageIndex;
              },
              itemBuilder: (context, pageIndex) => widget.dataModel.pageWidget(
                context: context,
                pageIndex: pageIndex,
              ),
            ),
          ),
          if (!widget.dataModel.isTabBarAtTop)
            CommonTabBar(
              onTabChange: (int pageIndex) {
                if (widget.dataModel.pageChangeCallback != null) {
                  widget.dataModel.pageChangeCallback!(pageIndex);
                }
                _pageController.jumpToPage(pageIndex);
              },
              tabChangeNotifier: _tabNotifier,
              tabBarList: [
                for (int tabIndex = 0;
                    tabIndex < widget.dataModel.totalPageCount;
                    tabIndex++)
                  CommonTabBarModel(
                    activeIcon: widget.dataModel.tabBarWidget(
                      pageIndex: tabIndex,
                      isActive: true,
                    ),
                    inActiveIcon: widget.dataModel.tabBarWidget(
                      pageIndex: tabIndex,
                      isActive: false,
                    ),
                  ),
              ],
            ),
        ],
      );
}
