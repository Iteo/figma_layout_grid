import 'package:figma_layout_grid/src/params.dart';
import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  const Columns({
    super.key,
    required this.visible,
    required this.params,
  });

  /// Specifies the visibility of column layout
  final bool visible;

  /// Columns visual parameters, see more at [ColumnsParams].
  final ColumnsParams params;

  @override
  Widget build(BuildContext context) {
    final bool countSpecified =
        params.count != null ? params.count! > 0 : false;

    if (!visible) {
      return const SizedBox.shrink();
    }

    return SizedBox.expand(
      child: IgnorePointer(
        child: countSpecified
            ? _SpecifiedCountColumns(
                params: params,
              )
            : _DynamicColumns(
                params: params,
              ),
      ),
    );
  }
}

class _DynamicColumns extends StatelessWidget {
  const _DynamicColumns({
    required this.params,
  });

  final ColumnsParams params;

  @override
  Widget build(BuildContext context) {
    final hasOffset = params.offset > 0;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildItem(index, hasOffset);
      },
    );
  }

  _Column _buildItem(int index, bool hasOffset) {
    if (index == 0 && hasOffset) {
      return _Column(
        width: params.offset,
      );
    }
    if (hasOffset) {
      if (index.isOdd) {
        return _Column(
          width: params.width,
          color: params.color,
        );
      }
    } else {
      if (index.isEven) {
        return _Column(
          width: params.width,
          color: params.color,
        );
      }
    }

    return _Column(
      width: params.gutter,
    );
  }
}

class _SpecifiedCountColumns extends StatelessWidget {
  const _SpecifiedCountColumns({
    required this.params,
  });

  final ColumnsParams params;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < params.count!; i++) {
      if (params.arrangement == ColumnsArrangement.stretch) {
        children.add(
          Flexible(
            child: _Column(
              width: double.infinity,
              color: params.color,
            ),
          ),
        );
      } else {
        children.add(
          _Column(
            width: params.width,
            color: params.color,
          ),
        );
      }
      if (i < params.count! - 1) {
        children.add(
          _Column(
            width: params.gutter,
          ),
        );
      }
    }

    return Padding(
      padding: _mapPadding(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: _mapArrangement(),
        children: children,
      ),
    );
  }

  MainAxisAlignment _mapArrangement() {
    switch (params.arrangement) {
      case ColumnsArrangement.stretch:
        return MainAxisAlignment.spaceBetween;
      case ColumnsArrangement.left:
        return MainAxisAlignment.start;
      case ColumnsArrangement.right:
        return MainAxisAlignment.end;
      case ColumnsArrangement.center:
        return MainAxisAlignment.center;
    }
  }

  EdgeInsets _mapPadding() {
    switch (params.arrangement) {
      case ColumnsArrangement.stretch:
        return EdgeInsets.symmetric(
          horizontal: params.margin,
        );
      case ColumnsArrangement.left:
        return EdgeInsets.only(
          left: params.offset,
        );
      case ColumnsArrangement.right:
        return EdgeInsets.only(
          right: params.offset,
        );
      case ColumnsArrangement.center:
        return EdgeInsets.zero;
    }
  }
}

class _Column extends StatelessWidget {
  const _Column({
    required this.width,
    this.color,
  });

  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: width,
      color: color,
    );
  }
}
