import 'package:flutter/material.dart';
import 'package:theme_app_framework/core_utils/screen_util.dart';
import 'package:theme_app_framework/presentation/common_widgets/common_page_view/common_page_view.dart';
import 'package:theme_app_framework/presentation/common_widgets/common_tab_bar/common_tab_bar.dart';
import 'package:theme_app_framework/presentation/common_widgets/common_tab_bar/entity/common_tab_bar_model.dart';
import 'package:theme_app_framework/presentation/widgets/super_statefull_widget.dart';
import 'package:theme_app_framework/presentation/widgets/super_stateless_widget.dart';

///
class MyApp extends SuperStatefulWidget {
  ///
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends SuperStatefulWidgetState {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: SafeArea(child: _PageViewWidget()),
        ),
      );

  @override
  Widget buildMobileApp(BuildContext context, ScreenUtil? screenUtil) =>
      SizedBox.shrink();

  @override
  Widget buildTabletApp(BuildContext context, ScreenUtil? screenUtil) =>
      SizedBox.shrink();
}

class _AppBarWidget extends SuperStatelessWidget {
  const _AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CommonTabBar(
        tabBarList: [
          CommonTabBarModel(
            tabTitle: 'Home',
            activeIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.home,
                size: 16,
              ),
            ),
            inActiveIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.home,
                size: 16,
              ),
            ),
          ),
          CommonTabBarModel(
            tabTitle: 'Favorite',
            activeIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.favorite,
                size: 16,
              ),
            ),
            inActiveIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.favorite,
                size: 16,
              ),
            ),
          ),
          CommonTabBarModel(
            tabTitle: 'Filter',
            activeIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.sort,
                size: 16,
              ),
            ),
            inActiveIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.sort,
                size: 16,
              ),
            ),
          ),
          CommonTabBarModel(
            tabTitle: 'Profile',
            activeIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.person,
                size: 16,
              ),
            ),
            inActiveIcon: SizedBox(
              height: 24.toHeight,
              width: 24.toHeight,
              child: Icon(
                Icons.person,
                size: 16,
              ),
            ),
          ),
          // for (int i = 0; i < 4; i++)
          //     CommonTabBarModel(
          //       tabTitle: 'title ${i + 1}',
          //       activeIcon: SizedBox(
          //         height: 24.toHeight,
          //         width: 24.toHeight,
          //         child: Icon(Icons.add),
          //       ),
          //       inActiveIcon: SizedBox(
          //         height: 24.toHeight,
          //         width: 24.toHeight,
          //         child: Icon(Icons.remove),
          //       ),
          //     ),
        ],
        onTabChange: (int index) {
          print('hello $index');
        },
      );
}

class _PageViewWidget extends StatelessWidget {
  const _PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CommonPageView(
        pageWidget: ({
          required BuildContext context,
          required int pageIndex,
        }) =>
            Container(
          height: 40,
          width: 40,
          color: _getPageColor(pageIndex),
          child: Center(
            child: Text('Hello ${pageIndex + 1}'),
          ),
        ),
        tabBarWidget: ({
          required int pageIndex,
          required bool isActive,
        }) =>
            Column(
          children: [
            Container(
              height: 10,
              width: 10,
              color: _getPageColor(pageIndex),
            ),
            Text('Title ${pageIndex + 1}'),
          ],
        ),
        totalPageCount: 4,
      );

  Color _getPageColor(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      default:
        return Colors.orange;
    }
  }
}
