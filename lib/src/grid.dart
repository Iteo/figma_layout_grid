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
        child: Stack(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  return ColoredBox(
                    color: params.color,
                    child: const SizedBox(
                      height: 1,
                    ),
                  );
                } else {
                  return SizedBox(
                    height: params.size,
                  );
                }
              },
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  return ColoredBox(
                    color: params.color,
                    child: const SizedBox(
                      width: 1,
                    ),
                  );
                } else {
                  return SizedBox(
                    width: params.size,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
