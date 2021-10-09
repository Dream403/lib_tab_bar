import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomImageItem extends StatefulWidget {
  final String? iconNetwork;
  final String? selectedIconNetwork;
  final String? icon;
  final String? selectedIcon;
  final double? width;
  final double? height;
  final bool state;
  const AppBottomImageItem(
      {Key? key,
      this.iconNetwork,
      this.selectedIconNetwork,
      this.width,
      this.height,
      this.selectedIcon,
      this.state = false,
      this.icon})
      : super(key: key);
  @override
  _AppBottomImageItemState createState() => _AppBottomImageItemState();
}

class _AppBottomImageItemState extends State<AppBottomImageItem> {
  Widget _buildLocationImage() {
    return Image.asset(widget.state ? widget.selectedIcon! : widget.icon!,
        width: widget.width, height: widget.height);
  }

  Widget _buildNetWorkImage() {
    return Image.network(
        widget.state ? widget.selectedIconNetwork! : widget.iconNetwork!,
        width: widget.width,
        height: widget.height);
  }

  @override
  Widget build(BuildContext context) {
    //判断是否网络图片
    return (widget.selectedIconNetwork != null && widget.iconNetwork != null)
        ? _buildNetWorkImage()
        : _buildLocationImage();
  }
}
