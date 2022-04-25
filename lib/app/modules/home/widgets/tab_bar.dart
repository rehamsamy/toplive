import 'package:flutter/material.dart';
import 'package:toplive/core/resourses/color_manger.dart';
import 'package:toplive/core/resourses/styles_manger.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

class TabBarAndTabViews extends StatefulWidget {
  final List<TabPair> tabs;

  const TabBarAndTabViews({Key? key, required this.tabs}) : super(key: key);
  @override
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // give the tab bar a height [can change height to preferred height]
          Container(
            height: 45,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: TabBar(
                  labelStyle: getMediumTextStyle(fontSize: 14),
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicatorSize: TabBarIndicatorSize.label, //makes it better
                  labelColor: ColorsManger.primary, //Google's sweet blue
                  unselectedLabelColor: Color(0xff5f6368), //niceish grey
                  // isScrollable: true, //up to your taste
                  indicator: MaterialIndicator(
                    tabPosition: TabPosition.bottom,
                    color: ColorsManger.primary,
                    strokeWidth: 6,
                    paintingStyle: PaintingStyle.fill,
                  ),
                  tabs: widget.tabs.map((tabPair) => tabPair.tab).toList()),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: widget.tabs.map((tabPair) => tabPair.view).toList()),
          ),
        ],
      ),
    );
  }
}
