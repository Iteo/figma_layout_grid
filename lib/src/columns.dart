import 'package:figma_layout_grid/src/params.dart';
import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  const Columns({
    super.key,
    required this.visible,
    required this.params,
  });

  final bool visible;
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
<<<<<<< HEAD
        return _buildItem(index, hasOffset);
=======
        print(index);
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
>>>>>>> 2decc26 (feat: Support web and destkop)
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
      if (params.arrangement == ColumnsArragement.stretch) {
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
      case ColumnsArragement.stretch:
        return MainAxisAlignment.spaceBetween;
      case ColumnsArragement.left:
        return MainAxisAlignment.start;
      case ColumnsArragement.right:
        return MainAxisAlignment.end;
      case ColumnsArragement.center:
        return MainAxisAlignment.center;
    }
  }

  EdgeInsets _mapPadding() {
    switch (params.arrangement) {
      case ColumnsArragement.stretch:
        return EdgeInsets.symmetric(
          horizontal: params.margin,
        );
      case ColumnsArragement.left:
        return EdgeInsets.only(
          left: params.offset,
        );
      case ColumnsArragement.right:
        return EdgeInsets.only(
          right: params.offset,
        );
      case ColumnsArragement.center:
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
