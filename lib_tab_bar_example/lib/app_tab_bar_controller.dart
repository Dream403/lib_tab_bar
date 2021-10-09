import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_tab_bar/bar/app_bottom_bar.dart';
import 'package:lib_tab_bar/bar/app_bottom_bar_item.dart';

class AppTabBarController extends StatefulWidget {
  const AppTabBarController({Key? key}) : super(key: key);

  @override
  _AppTabBarControllerState createState() => _AppTabBarControllerState();
}

class _AppTabBarControllerState extends State<AppTabBarController> {
  int _currentIdx = 0;

  //zx_search.svg
  final List<FaTaBarBottomBarBaseItem> _items = [
    FaTaBarBottomBarLottieItem(
        title: "社区",
        icon: "images/tabBar/tabBar_community/tabBar_community.json"),
    FaTaBarBottomBarLottieItem(
        title: "发现",
        iconNetwork: "https://assets9.lottiefiles.com/private_files/lf30_3ezlslmp.json"),
    FaTaBarBottomBarEmptyItem(),
    FaTaBarBottomBarImageItem(
        title: '测试',
        icon: 'images/zx_discovery_selected.png',
        selectedIcon: 'images/zx_discovery_selected.png'),
    FaTaBarBottomBarImageItem(
        normalWidget: Container(
          width: 50,
          child: Text("data", style: TextStyle(fontSize: 15)),
        ),
        selectedWidget: Container(
          width: 50,
          child: Text(
            "wqw3",
            style: TextStyle(fontSize: 15),
          ),
        ))
  ];

  List<Widget> _pages = [
    Center(child: Text('1')),
    Center(child: Text('2')),
    Center(child: Text('3')),
    Center(child: Text('4')),
    Center(child: Text('5')),
  ];

  Widget _buildRTLBottomBar() {
    return FaTaBarBottomBar(
      currentIndex: _currentIdx,
      onTap: (int idx) {
        setState(() {
          _currentIdx = idx;
        });
      },
      backgroundColor: Colors.white,
      items: _items,
      textColor: Color(0xff000000),
      selectedTextColor: Color(0xfff95563),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Bottom Navigation')),
        body: _pages[_currentIdx],
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            child: _buildRTLBottomBar()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            print("object"),
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
