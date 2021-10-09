import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AppBottomLottieItem extends StatefulWidget {
  final String? iconNetwork;
  final String? icon;
  final double? width;
  final double? height;
  final bool state;
  const AppBottomLottieItem(
      {Key? key,
      this.iconNetwork,
      this.icon,
      this.width,
      this.height,
      this.state = false})
      : super(key: key);
  @override
  _AppBottomLottieItemState createState() => _AppBottomLottieItemState();
}

class _AppBottomLottieItemState extends State<AppBottomLottieItem>
    with TickerProviderStateMixin {
  late AnimationController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = AnimationController(
      duration: Duration(seconds: (1)),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant AppBottomLottieItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    onClick(widget.state);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  //点击事件
  void onClick(bool state) {
    if (state) {
      _tabController.forward();
    } else {
      _tabController.reset();
    }
  }

  Widget _buildLocationLottie() {
    return Lottie.asset(
      widget.icon!,
      width: widget.width,
      height: widget.height,
      controller: _tabController,
      onLoaded: (composition) => {
        if (widget.state)
          {
            _tabController.forward(),
          }
        else
          {
            _tabController.reset(),
          }
      },
      animate: true,
    );
  }

  Widget _buildNetworkLottie() {
    return Lottie.network(widget.iconNetwork!,
        width: widget.width,
        height: widget.height,
        controller: _tabController,
        onLoaded: (composition) => {
              if (widget.state)
                {
                  _tabController.forward(),
                }
              else
                {
                  _tabController.reset(),
                }
            },
        animate: true);
  }

  @override
  Widget build(BuildContext context) {
    return (widget.iconNetwork != null)
        ? _buildNetworkLottie()
        : _buildLocationLottie();
  }
}
