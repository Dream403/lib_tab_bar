import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FaTaBarBottomBarBaseItem {
  // 标题
  String? title;
  // 默认 icon
  String? icon;
  //选中 icon
  String? selectedIcon;
  //网络地址 icon
  String? iconNetwork;
  //选中网络地址
  String? selectedIconNetwork;
  //自定义widget
  Widget? normalWidget;
  //选中自定义 widget
  Widget? selectedWidget;

  FaTaBarBottomBarBaseItem(
      {this.title,
      this.icon,
      this.selectedIcon,
      this.iconNetwork,
      this.selectedIconNetwork,
      this.normalWidget,
      this.selectedWidget});
}

//图片
class FaTaBarBottomBarImageItem extends FaTaBarBottomBarBaseItem {
  FaTaBarBottomBarImageItem(
      {String? title,
      String? icon,
      String? selectedIcon,
      String? iconNetwork,
      String? selectedIconNetwork,
      Widget? normalWidget,
      Widget? selectedWidget})
      : super(
            title: title,
            icon: icon,
            selectedIcon: selectedIcon,
            iconNetwork: iconNetwork,
            selectedIconNetwork: selectedIconNetwork,
            normalWidget: normalWidget,
            selectedWidget: selectedWidget);
}

// svg  资源
class FaTaBarBottomBarSvgItem extends FaTaBarBottomBarBaseItem {
  FaTaBarBottomBarSvgItem(
      {String? title,
      String? icon,
      String? selectedIcon,
      String? iconNetwork,
      String? selectedIconNetwork,
      Widget? normalWidget,
      Widget? selectedWidget})
      : super(
            title: title,
            icon: icon,
            selectedIcon: selectedIcon,
            iconNetwork: iconNetwork,
            selectedIconNetwork: selectedIconNetwork,
            normalWidget: normalWidget,
            selectedWidget: selectedWidget);
}

// lottie 资源
class FaTaBarBottomBarLottieItem extends FaTaBarBottomBarBaseItem {
  FaTaBarBottomBarLottieItem(
      {String? title,
      String? icon,
      String? iconNetwork,
      Widget? normalWidget,
      Widget? selectedWidget})
      : super(
            title: title,
            icon: icon,
            iconNetwork: iconNetwork,
            normalWidget: normalWidget,
            selectedWidget: selectedWidget);
}

class FaTaBarBottomBarEmptyItem extends FaTaBarBottomBarBaseItem {
  FaTaBarBottomBarEmptyItem();
}
