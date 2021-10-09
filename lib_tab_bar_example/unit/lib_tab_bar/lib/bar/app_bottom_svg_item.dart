import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomSvgItem extends StatefulWidget {
  final String? iconNetwork;
  final String? selectedIconNetwork;
  final String? icon;
  final String? selectedIcon;
  final double? width;
  final double? height;
  final bool state;
  const AppBottomSvgItem(
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
  _AppBottomSvgItemState createState() => _AppBottomSvgItemState();
}

class _AppBottomSvgItemState extends State<AppBottomSvgItem> {
  Widget _buildLocationSvg() {
    return SvgPicture.asset(widget.state ? widget.selectedIcon! : widget.icon!,
        width: widget.width!, height: widget.height!);
  }

  Widget _buildNetWorkSvg() {
    return SvgPicture.network(
        widget.state ? widget.selectedIconNetwork! : widget.iconNetwork!,
        width: widget.width!,
        height: widget.height!);
  }

  @override
  Widget build(BuildContext context) {
    //判断是否网络Svg
    return (widget.selectedIconNetwork != null && widget.iconNetwork != null)
        ? _buildNetWorkSvg()
        : _buildLocationSvg();
  }
}
