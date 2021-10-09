import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomBarTitleItem extends StatefulWidget {
  final bool state;
  final String? title;
  final Color textColor;
  final Color selectedTextColor;
  final double normalTextFontSize;
  final double selectedTextFontSize;
  final FontWeight normalTextFontWeight;
  final FontWeight selectedTextFontWeight;

  const AppBottomBarTitleItem(
      {Key? key,
      this.textColor = Colors.black,
      this.selectedTextColor = Colors.red,
      this.normalTextFontSize = 12,
      this.selectedTextFontSize = 12,
      this.normalTextFontWeight = FontWeight.normal,
      this.selectedTextFontWeight = FontWeight.bold,
      this.state = false,
      this.title})
      : super(key: key);

  @override
  _AppBottomBarTitleItemState createState() => _AppBottomBarTitleItemState();
}

class _AppBottomBarTitleItemState extends State<AppBottomBarTitleItem> {
  @override
  Widget build(BuildContext context) {
    //判断处理文字
    return (widget.title != null)
        ? Text(
            widget.title!,
            style: TextStyle(
                color:
                    widget.state ? widget.selectedTextColor : widget.textColor,
                fontSize: widget.state
                    ? widget.normalTextFontSize
                    : widget.selectedTextFontSize,
                fontWeight: widget.state
                    ? widget.normalTextFontWeight
                    : widget.selectedTextFontWeight),
          )
        : Container();
  }
}
