import 'package:figma_layout_grid/src/params.dart';
import 'package:flutter/material.dart';

class Rows extends StatelessWidget {
  const Rows({
    super.key,
    required this.visible,
    required this.params,
  });

  /// Specifies the visibility of row layout
  final bool visible;

  /// Rows visual parameters, see more at [RowsParams].
  final RowsParams params;

  @override
  Widget build(BuildContext context) {
    final bool countSpecified =
        params.count != null ? params.count! > 0 : false;

    if (!visible) {
      return const SizedBox.shrink();
    }

    return SizedBox.expand(
      key: const Key('rows'),
      child: IgnorePointer(
        child: countSpecified
            ? _SpecifiedCountRows(
                params: params,
              )
            : _DynamicRows(
                params: params,
              ),
      ),
    );
  }
}

class _DynamicRows extends StatelessWidget {
  const _DynamicRows({
    Key? key,
    required this.params,
  }) : super(key: key);

  final RowsParams params;

  @override
  Widget build(BuildContext context) {
    final hasOffset = params.offset > 0;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildItem(index, hasOffset);
      },
    );
  }

  _Row _buildItem(int index, bool hasOffset) {
    if (index == 0 && hasOffset) {
      return _Row(
        height: params.offset,
      );
    }
    if (hasOffset) {
      if (index.isOdd) {
        return _Row(
          height: params.height,
          color: params.color,
        );
      }
    } else {
      if (index.isEven) {
        return _Row(
          height: params.height,
          color: params.color,
        );
      }
    }

    return _Row(
      height: params.gutter,
    );
  }
}

class _SpecifiedCountRows extends StatelessWidget {
  const _SpecifiedCountRows({
    Key? key,
    required this.params,
  }) : super(key: key);

  final RowsParams params;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < params.count!; i++) {
      if (params.arrangement == RowsArrangement.stretch) {
        children.add(
          Flexible(
            child: _Row(
              height: double.infinity,
              color: params.color,
            ),
          ),
        );
      } else {
        children.add(
          _Row(
            height: params.height,
            color: params.color,
          ),
        );
      }
      if (i < params.count! - 1) {
        children.add(
          _Row(
            height: params.gutter,
          ),
        );
      }
    }

    return Padding(
      padding: _mapPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: _mapArrangement(),
        children: children,
      ),
    );
  }

  MainAxisAlignment _mapArrangement() {
    switch (params.arrangement) {
      case RowsArrangement.stretch:
        return MainAxisAlignment.spaceBetween;
      case RowsArrangement.top:
        return MainAxisAlignment.start;
      case RowsArrangement.bottom:
        return MainAxisAlignment.end;
      case RowsArrangement.center:
        return MainAxisAlignment.center;
    }
  }

  EdgeInsets _mapPadding() {
    switch (params.arrangement) {
      case RowsArrangement.stretch:
        return EdgeInsets.symmetric(
          vertical: params.margin,
        );
      case RowsArrangement.top:
        return EdgeInsets.only(
          top: params.offset,
        );
      case RowsArrangement.bottom:
        return EdgeInsets.only(
          bottom: params.offset,
        );
      case RowsArrangement.center:
        return EdgeInsets.zero;
    }
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.height,
    this.color,
  });

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: color != null ? const Key('row') : const Key('row-gap'),
      height: height,
      width: double.infinity,
      color: color,
    );
  }
}
