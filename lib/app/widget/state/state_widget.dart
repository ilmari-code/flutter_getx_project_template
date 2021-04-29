import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_getx_project_template/gen_a/A.dart';

import 'empty_widget.dart';

class StateWidget extends StatefulWidget {
  final ViewState state;
  final bool hasData;
  final Function(BuildContext context)? builder;
  final Widget? loadWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final VoidCallback? onErrorTap;
  final VoidCallback? onEmptyTap;
  final AlignmentGeometry errorAlignment;

  final AlignmentGeometry emptyAlignment;

  final AlignmentGeometry loadAlignment;

  StateWidget({
    this.state = ViewState.LOADING,
    this.hasData = false,
    @required this.builder,
    this.loadWidget,
    this.errorWidget,
    this.emptyWidget,
    this.onErrorTap,
    this.onEmptyTap,
    this.emptyAlignment = Alignment.center,
    this.errorAlignment = Alignment.center,
    this.loadAlignment = Alignment.center,
  });

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.hasData) {
      child = widget.builder?.call(context);
    } else {
      switch (widget.state) {
        case ViewState.LOADING:
          child = _loadingWidget(
            child: widget.loadWidget,
          );
          break;
        case ViewState.ERROR:
          child =
              _errorWidget(child: widget.errorWidget, onTap: widget.onErrorTap);
          break;
        case ViewState.SUCCESS:
          child =
              _emptyWidget(child: widget.emptyWidget, onTap: widget.onEmptyTap);
          break;
      }
    }
    return _switcher(child);
  }

  Widget _loadingWidget({
    Widget? child,
    bool fullScreen = true,
    VoidCallback? onTap,
  }) {
    child ??= CircularProgressIndicator(strokeWidth: 2.0);
    return LayoutBuilder(
        key: Key('loading'),
        builder: (context, constraints) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Align(alignment: widget.loadAlignment, child: child),
            ),
          );
        });
  }

  Widget _errorWidget({
    Widget? child,
    VoidCallback? onTap,
  }) {
    return LayoutBuilder(
        key: Key('erorr'),
        builder: (context, constraints) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Align(
                  alignment: widget.errorAlignment,
                  child: child ??
                      EmptyWidget(
                        title: '网络不给力',
                        desc: '点击屏幕尝试重新连接',
                        // image: Image.asset(
                        //   "",
                        //   width: constraints.maxHeight /
                        //       ScreenUtil.getInstance().screenHeight *
                        //       120,
                        //   height: constraints.maxHeight /
                        //       ScreenUtil.getInstance().screenHeight *
                        //       120,
                        // ),
                      )),
            ),
          );
        });
  }

  Widget _emptyWidget({
    Widget? child,
    VoidCallback? onTap,
  }) {
    child ??= EmptyWidget(
      title: '暂无展示信息~',
      image: Image.asset(
          //TODO 图片
          A.assets_images_placehold),
    );
    return LayoutBuilder(
        key: Key('empty'),
        builder: (context, constraints) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Align(child: child, alignment: widget.emptyAlignment),
            ),
          );
        });
  }

  Widget _switcher(Widget child) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: child,
    );
  }
}

enum ViewState { SUCCESS, ERROR, LOADING }
