// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../ui.dart';
import 'empty.dart';

typedef DataRequesterWrap<T> = Future<List<T>> Function(int offset);
typedef InitRequesterWrap<T> = Future<List<T>> Function();
typedef ItemBuilderWrap<T> = Widget Function(List<T> data, BuildContext context, int index);

class LoadMoreWrapVertical<T> extends StatefulWidget {
  const LoadMoreWrapVertical.build({
    super.key,
    required this.itemBuilder,
    required this.dataRequester,
    required this.initRequester,
    this.padding,
    this.styleError,
    this.loadingColor,
    this.loadingColorBackground,
    this.widgetError,
    this.initialData,
    this.onScrollable,
    this.initialScrollOffset,
  });

  final TextStyle? styleError;
  final ItemBuilderWrap<T> itemBuilder;
  final DataRequesterWrap<T> dataRequester;
  final InitRequesterWrap<T> initRequester;
  final EdgeInsets? padding;
  final Color? loadingColor;
  final Color? loadingColorBackground;
  final Widget? widgetError;
  final List<T>? initialData;
  final Function(double)? onScrollable;
  final double? initialScrollOffset;

  @override
  State createState() => LoadMoreWrapVerticalState<T>();
}

// ignore: always_specify_types
class LoadMoreWrapVerticalState<T> extends State<LoadMoreWrapVertical<T>> {
  late final ScrollController _controller = ScrollController(initialScrollOffset: widget.initialScrollOffset ?? 0);

  late List<T>? _dataList = widget.initialData;
  List<Widget>? children;
  bool isPerformingRequest = false;

  int? get numOfItems => _dataList?.length;

  @override
  void initState() {
    super.initState();
    if (_dataList?.isEmpty ?? true) {
      onRefresh();
    }
    _controller.addListener(() {
      if(widget.onScrollable != null)
        widget.onScrollable!(_controller.position.pixels);
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    children = _dataList?.map((T e) => widget.itemBuilder(_dataList!, context, _dataList!.indexOf(e))).toList();
    return _dataList == null
        ? loadingProgress()
        : (_dataList!.isNotEmpty
            ? RefreshIndicator(
                color: widget.loadingColor ?? AppColors.primary,
                onRefresh: onRefresh,
                child: SingleChildScrollView(
                  controller: _controller,
                  padding: widget.padding ?? EdgeInsets.zero,
                  child: Wrap(
                    children: children! + <Widget>[opacityLoadingProgress(isPerformingRequest)],
                  ),
                ),
              )
            : RefreshIndicator(
                color: widget.loadingColor ?? AppColors.primary,
                onRefresh: onRefresh,
                child: Stack(
                  children: <Widget>[
                    ListView(
                      shrinkWrap: true,
                    ),
                    widget.widgetError ?? const LoadMoreEmpty(),
                  ],
                ),
              ));
  }

  Future<void> onRefresh() async {
    if (mounted) {
      setState(() => _dataList = null);
    }
    final List<T> initDataList = await widget.initRequester();
    if (mounted) {
      setState(() => _dataList = initDataList);
    }
    return;
  }

  Future<void> _loadMore() async {
    if (mounted) {
      setState(() => isPerformingRequest = true);
      int currentSize = 0;
      if (_dataList != null) {
        currentSize = _dataList!.length;
      }

      final List<T> newDataList = await widget.dataRequester(currentSize);
      if (newDataList.isEmpty) {
        const double edge = 50.0;
        final double offsetFromBottom = _controller.position.maxScrollExtent - _controller.position.pixels;
        if (offsetFromBottom < edge) {
          _controller.animateTo(_controller.offset - (edge - offsetFromBottom), duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
        }
      } else {
        _dataList!.addAll(newDataList);
      }
      if (mounted) {
        setState(() => isPerformingRequest = false);
      }
    }
  }

  Widget loadingProgress() {
    return Center(
      child: CircularProgressIndicator(
        color: widget.loadingColor,
      ),
    );
  }

  Widget opacityLoadingProgress(bool isPerformingRequest) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(
            color: widget.loadingColor,
          ),
        ),
      ),
    );
  }
}
