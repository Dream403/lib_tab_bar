import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_bottom_bar_item.dart';
import 'app_bottom_bar_title_item.dart';
import 'app_bottom_image_item.dart';
import 'app_bottom_lottie_item.dart';
import 'app_bottom_svg_item.dart';

class FaTaBarBottomBar extends StatefulWidget {
  final List<FaTaBarBottomBarBaseItem> items;
  final int currentIndex;
  final Color backgroundColor;
  final ValueChanged<int>? onTap;
  final Color textColor;
  final Color selectedTextColor;
  final double normalTextFontSize;
  final double selectedTextFontSize;
  final FontWeight normalTextFontWeight;
  final FontWeight selectedTextFontWeight;
  final double tabBarHeight;
  final EdgeInsetsGeometry tabBarInset;
  final double tabBarItemWidth;
  final double tabBarItemHeight;
  const FaTaBarBottomBar(
      {Key? key,
      required this.items,
      this.onTap,
      this.currentIndex = 0,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.selectedTextColor = Colors.red,
      this.tabBarHeight = 88,
      this.tabBarItemWidth = 35,
      this.normalTextFontSize = 12,
      this.selectedTextFontSize = 12,
      this.normalTextFontWeight = FontWeight.normal,
      this.selectedTextFontWeight = FontWeight.bold,
      this.tabBarItemHeight = 35,
      this.tabBarInset =
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10)})
      : super(key: key);
  @override
  _FaTaBarBottomBarState createState() => _FaTaBarBottomBarState();
}

class _FaTaBarBottomBarState extends State<FaTaBarBottomBar> {
  late int _currentIdx;
  @override
  void initState() {
    _currentIdx = widget.currentIndex;
    super.initState();
  }

  Widget _buildRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items
            .asMap()
            .map((idx, item) => MapEntry(idx, _buildRowItem(idx, item)))
            .values
            .toList());
  }

  Widget _buildRowItem(int idx, FaTaBarBottomBarBaseItem item) {
    bool state = (idx == _currentIdx);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _currentIdx = idx;
          widget.onTap!(_currentIdx);
        });
      },
      child: _buildItem(item, state, idx),
    );
  }

  /*
  * 初始化默认 Widget
  * */
  Widget _buildDefault(FaTaBarBottomBarBaseItem item, bool state, int idx) {
    if (item is FaTaBarBottomBarImageItem) {
      return Column(
        children: [
          //处理显示的问题
          AppBottomImageItem(
            iconNetwork: item.iconNetwork,
            icon: item.icon,
            width: widget.tabBarItemWidth,
            height: widget.tabBarItemHeight,
            state: state,
            selectedIcon: item.selectedIcon,
            selectedIconNetwork: item.selectedIconNetwork,
          ),

          (item.title != null) ? SizedBox(height: 8) : Container(),

          AppBottomBarTitleItem(
              title: item.title,
              textColor: widget.textColor,
              selectedTextColor: widget.selectedTextColor,
              normalTextFontSize: widget.normalTextFontSize,
              normalTextFontWeight: widget.normalTextFontWeight,
              selectedTextFontSize: widget.selectedTextFontSize,
              selectedTextFontWeight: widget.selectedTextFontWeight,
              state: state),
        ],
      );
    } else if (item is FaTaBarBottomBarLottieItem) {
      return Column(
        children: [
          //处理显示的问题
          AppBottomLottieItem(
              icon: item.icon,
              iconNetwork: item.iconNetwork,
              state: state,
              width: widget.tabBarItemWidth,
              height: widget.tabBarItemHeight),
          (item.title != null) ? SizedBox(height: 8) : Container(),
          AppBottomBarTitleItem(
              title: item.title,
              textColor: widget.textColor,
              selectedTextColor: widget.selectedTextColor,
              normalTextFontSize: widget.normalTextFontSize,
              normalTextFontWeight: widget.normalTextFontWeight,
              selectedTextFontSize: widget.selectedTextFontSize,
              selectedTextFontWeight: widget.selectedTextFontWeight,
              state: state),
        ],
      );
    } else if (item is FaTaBarBottomBarSvgItem) {
      return Column(
        children: [
          //处理显示的问题
          AppBottomSvgItem(
            iconNetwork: item.iconNetwork,
            icon: item.icon,
            width: widget.tabBarItemWidth,
            height: widget.tabBarItemHeight,
            state: state,
            selectedIcon: item.selectedIcon,
            selectedIconNetwork: item.selectedIconNetwork,
          ),
          (item.title != null) ? SizedBox(height: 8) : Container(),
          AppBottomBarTitleItem(
              title: item.title,
              textColor: widget.textColor,
              selectedTextColor: widget.selectedTextColor,
              normalTextFontSize: widget.normalTextFontSize,
              normalTextFontWeight: widget.normalTextFontWeight,
              selectedTextFontSize: widget.selectedTextFontSize,
              selectedTextFontWeight: widget.selectedTextFontWeight,
              state: state),
        ],
      );
    } else if (item is FaTaBarBottomBarEmptyItem) {
      return SizedBox();
    } else {
      //未知类型
      return Container();
    }
  }

  /*
  * 自定义 Widget
  * */
  Widget _buildCustom(FaTaBarBottomBarBaseItem item, bool state) {
    return state ? item.selectedWidget! : item.normalWidget!;
  }

  Widget _buildItem(FaTaBarBottomBarBaseItem item, bool state, int idx) {
    return Container(
        height: widget.tabBarHeight,
        padding: widget.tabBarInset,
        //判断是不为空 则是自定义
        child: (item.selectedWidget != null && item.normalWidget != null)
            ? _buildCustom(item, state)
            : _buildDefault(item, state, idx));
  }

  @override
  Widget build(BuildContext context) {
    _currentIdx = widget.currentIndex;
    return _buildRow();
  }
}
