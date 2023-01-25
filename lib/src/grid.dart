import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
    required this.visible,
    required this.params,
  });

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
