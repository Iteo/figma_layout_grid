import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    Key? key,
    required this.child,
    required this.showGridRows,
    required this.showGridColumns,
  }) : super(key: key);

  final ValueNotifier<bool> showGridRows;
  final ValueNotifier<bool> showGridColumns;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: child,
        ),
        _GridRows(
          showGridRows: showGridRows,
        ),
        _GridColumns(
          showGridColumns: showGridColumns,
        ),
      ],
    );
  }
}

class _GridRows extends HookWidget {
  const _GridRows({
    Key? key,
    required this.showGridRows,
  }) : super(key: key);

  final ValueNotifier<bool> showGridRows;

  @override
  Widget build(BuildContext context) {
    final visible = useListenable(showGridRows).value;

    if (!visible) {
      return const SizedBox.shrink();
    }

    return SizedBox.expand(
      child: IgnorePointer(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            if (index.isEven) {
              return const SizedBox(
                height: 16,
                child: ColoredBox(
                  color: Color(0x1AFF0000),
                ),
              );
            }

            return const SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}

class _GridColumns extends HookWidget {
  const _GridColumns({
    Key? key,
    required this.showGridColumns,
  }) : super(key: key);

  final ValueNotifier<bool> showGridColumns;

  @override
  Widget build(BuildContext context) {
    final visible = useListenable(showGridColumns).value;
    if (!visible) {
      return const SizedBox.shrink();
    }

    return SizedBox.expand(
      child: IgnorePointer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: const [
            _Margin(),
            _Column(),
            _Gutter(),
            _Column(),
            _Gutter(),
            _Column(),
            _Gutter(),
            _Column(),
            _Gutter(),
            _Column(),
            _Gutter(),
            _Column(),
            _Margin(),
          ],
        ),
      ),
    );
  }
}

class _Column extends StatelessWidget {
  const _Column();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: ColoredBox(color: Color(0x1AFF0000)),
    );
  }
}

class _Margin extends StatelessWidget {
  const _Margin();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 20);
  }
}

class _Gutter extends StatelessWidget {
  const _Gutter();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 16);
  }
}
