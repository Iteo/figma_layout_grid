import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Grid extends HookWidget {
  const Grid({
    Key? key,
    required this.visible,
    required this.params,
  }) : super(key: key);

  final bool visible;
  final GridParams params;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox.shrink();
    }

    return SizedBox.expand(
      child: IgnorePointer(
        child: GridPaper(
          color: params.color,
          divisions: 1,
          subdivisions: 1,
          interval: params.size,
        ),
      ),
    );
  }
}
