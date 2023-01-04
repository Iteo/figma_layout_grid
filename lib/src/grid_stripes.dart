import 'package:figma_layout_grid/src/grid_params.dart';
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
    List<Widget> columns = [];

    final isRow = params.axis == Axis.vertical;

    for (int i = 0; i < params.count!; i++) {
      columns.add(
        Flexible(
          child: _Stripe(
            axis: params.axis,
            size: double.infinity,
            color: params.color,
          ),
        ),
      );
      if (i < params.count! - 1) {
        columns.add(_Stripe(
          axis: params.axis,
          size: double.infinity,
        ));
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isRow ? 0.0 : params.margin,
        vertical: isRow ? params.margin : 0.0,
      ),
      child: Flex(
        direction: isRow ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: columns,
      ),
    );
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
      height: axis == Axis.vertical ? size : null,
      width: axis == Axis.vertical ? null : size,
      child: color != null
          ? ColoredBox(
              color: color!,
            )
          : null,
    );
  }
}
