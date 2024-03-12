import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../ui.dart';
import 'empty.dart';
import 'loadmore_wrap_vertical.dart';

class SliverLoadMoreVertical<T> extends StatefulWidget {
  const SliverLoadMoreVertical.build({
    super.key,
    required this.itemBuilder,
    required this.dataRequester,
    required this.initRequester,
    this.padding,
    this.styleError,
    this.loadingColor,
    this.loadingColorBackground,
    this.widgetError,
    this.appBar,
  });

  final TextStyle? styleError;
  final ItemBuilderWrap<T> itemBuilder;
  final DataRequesterWrap<T> dataRequester;
  final InitRequesterWrap<T> initRequester;
  final EdgeInsets? padding;
  final Color? loadingColor;
  final Color? loadingColorBackground;
  final Widget? widgetError;
  final Widget? appBar;

  @override
  State createState() => SliverLoadMoreVerticalState<T>();
}

// ignore: always_specify_types
class SliverLoadMoreVerticalState<T>
    extends State<SliverLoadMoreVertical<T>> {
  bool isPerformingRequest = false;
  final ScrollController _controller = ScrollController();

  List<T>? _dataList;

  List<Widget> get body => <Widget>[
        if (_dataList == null)
          SliverToBoxAdapter(
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Center(
                child: loadingProgress(),
              ),
            ),
          )
        else if (_dataList!.isNotEmpty)
          SliverList(
            delegate: SliverChildListDelegate(
              _dataList
                      ?.map(
                        (T e) => widget.itemBuilder(
                            _dataList!, context, _dataList!.indexOf(e)),
                      )
                      .toList() ??
                  <Widget>[],
            ),
          )
        else
          SliverToBoxAdapter(
            child: widget.widgetError ?? const LoadMoreEmpty(),
          )
      ];

  @override
  void initState() {
    super.initState();
    onRefresh();
    _controller.addListener(() {
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
    return RefreshIndicator(
      color: widget.loadingColor ?? AppColors.primary,
      edgeOffset: 200,
      onRefresh: onRefresh,
      child: CustomScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
              widget.appBar ??
                  const SliverToBoxAdapter(
                    child: SizedBox(),
                  ),
            ] +
            body +
            <Widget>[
              SliverToBoxAdapter(
                child: opacityLoadingProgress(isPerformingRequest),
              )
            ],
      ),
    );
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
    if (_dataList?.isEmpty ?? true){
      return;
    }
    if (mounted) {
      setState(() => isPerformingRequest = true);
      int currentSize = 0;
      if (_dataList != null) {
        currentSize = _dataList!.length;
      }

      final List<T> newDataList = await widget.dataRequester(currentSize);
      if (newDataList.isEmpty) {
        const double edge = 50.0;
        final double offsetFromBottom =
            _controller.position.maxScrollExtent - _controller.position.pixels;
        if (offsetFromBottom < edge) {
          _controller.animateTo(_controller.offset - (edge - offsetFromBottom),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
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
