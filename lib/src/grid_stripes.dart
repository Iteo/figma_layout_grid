import 'package:figma_layout_grid/src/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GridStripes extends HookWidget {
  const GridStripes({
    Key? key,
    required this.visible,
    required this.params,
  }) : super(key: key);

  final ValueNotifier<bool> visible;
  final StripesParams params;

  @override
  Widget build(BuildContext context) {
    final showStripes = useListenable(visible).value;

    final bool countSpecified =
        params.count != null ? params.count! > 0 : false;

    if (!showStripes) {
      return const SizedBox.shrink();
    }

    return SizedBox.expand(
      child: IgnorePointer(
        child: countSpecified
            ? _StaticStripes(
                params: params,
              )
            : _DynamicStripes(
                params: params,
              ),
      ),
    );
  }
}

class _DynamicStripes extends StatelessWidget {
  const _DynamicStripes({
    Key? key,
    required this.params,
  }) : super(key: key);

  final StripesParams params;

  @override
  Widget build(BuildContext context) {
    final hasOffset = params.offset > 0;

    return ListView.builder(
      scrollDirection: params.axis,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 0 && hasOffset) {
          return _Stripe(
            size: params.offset,
            axis: params.axis,
          );
        }
        if (hasOffset) {
          if (index.isOdd) {
            return _Stripe(
              size: params.size,
              axis: params.axis,
              color: params.color,
            );
          }
        } else {
          if (index.isEven) {
            return _Stripe(
              size: params.size,
              axis: params.axis,
              color: params.color,
            );
          }
        }

        return _Stripe(
          size: params.gutter,
          axis: params.axis,
        );
      },
    );
  }
}

class _StaticStripes extends StatelessWidget {
  const _StaticStripes({
    Key? key,
    required this.params,
  }) : super(key: key);

  final StripesParams params;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < params.count!; i++) {
      if (params.arrangement == Arragement.stretch) {
        children.add(
          Flexible(
            child: _Stripe(
              axis: params.axis,
              size: double.infinity,
              color: params.color,
            ),
          ),
        );
      } else {
        children.add(
          _Stripe(
            axis: params.axis,
            size: params.size,
            color: params.color,
          ),
        );
      }
      if (i < params.count! - 1) {
        children.add(
          _Stripe(
            axis: params.axis,
            size: params.gutter,
          ),
        );
      }
    }

    return Padding(
      padding: _mapPadding(),
      child: Flex(
        direction: params.axis,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: _mapArrangement(),
        children: children,
      ),
    );
  }

  MainAxisAlignment _mapArrangement() {
    switch (params.arrangement) {
      case Arragement.stretch:
        return MainAxisAlignment.spaceBetween;
      case Arragement.left:
        return MainAxisAlignment.start;
      case Arragement.right:
        return MainAxisAlignment.end;
      case Arragement.center:
        return MainAxisAlignment.center;
      case Arragement.top:
        return MainAxisAlignment.start;
      case Arragement.bottom:
        return MainAxisAlignment.end;
    }
  }

  EdgeInsets _mapPadding() {
    switch (params.arrangement) {
      case Arragement.stretch:
        return EdgeInsets.symmetric(
          horizontal: params.axis == Axis.vertical ? 0.0 : params.margin,
          vertical: params.axis == Axis.vertical ? params.margin : 0.0,
        );
      case Arragement.left:
        return EdgeInsets.only(
          left: params.offset,
        );
      case Arragement.right:
        return EdgeInsets.only(
          right: params.offset,
        );
      case Arragement.center:
        return EdgeInsets.zero;
      case Arragement.top:
        return EdgeInsets.only(
          top: params.offset,
        );
      case Arragement.bottom:
        return EdgeInsets.only(
          bottom: params.offset,
        );
    }
  }
}

class _Stripe extends StatelessWidget {
  const _Stripe({
    Key? key,
    required this.axis,
    required this.size,
    this.color,
  }) : super(key: key);

  final Axis axis;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: axis == Axis.vertical ? size : double.infinity,
      width: axis == Axis.vertical ? double.infinity : size,
      child: color != null
          ? ColoredBox(
              color: color!,
            )
          : null,
    );
  }
}
