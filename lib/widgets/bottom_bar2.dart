import "package:cupertino_native/cupertino_native.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class BottomBar2 extends StatefulWidget {
  const BottomBar2({super.key});

  @override
  State<BottomBar2> createState() => _BottomBar2State();
}

class TabData {
  final String pageLabel;
  final String iconName;

  TabData({required this.pageLabel, required this.iconName});
}

class _BottomBar2State extends State<BottomBar2>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  final List<TabData> tabs = [
    TabData(pageLabel: "Home", iconName: "homepod.and.appletv.fill"),
    TabData(pageLabel: "Home", iconName: "video.badge.waveform.fill"),
    TabData(pageLabel: "Home", iconName: "message.badge.waveform.fill"),
    TabData(pageLabel: "Home", iconName: "apple.terminal.on.rectangle.fill"),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(updateTabIndex);
  }

  void updateTabIndex() {
    if (tabController.index != selectedIndex) {
      setState(() {
        selectedIndex = tabController.index;
      });
    }
  }

  void onTabTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    tabController.animateTo(index);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned.fill(
            child: TabBarView(
              controller: tabController,
              children: tabs
                  .map((tab) => ImageTabPage(label: tab.pageLabel))
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CNTabBar(
              items: tabs
                  .map(
                    (tab) => CNTabBarItem(
                      label: tab.pageLabel,
                      icon: CNSymbol(tab.iconName),
                    ),
                  )
                  .toList(),
              currentIndex: selectedIndex,
              tint: CupertinoColors.destructiveRed,
              height: 85,
              onTap: onTabTap,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageTabPage extends StatelessWidget {
  const ImageTabPage({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("assets/images/coffee_image.jpg", fit: BoxFit.cover),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: CupertinoColors.black.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                label,
                style: TextStyle(fontSize: 18, color: CupertinoColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
