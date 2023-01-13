import 'package:figma_layout_grid/src/columns.dart';
import 'package:figma_layout_grid/src/grid.dart';
import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/rows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LayoutGrid extends HookWidget {
  const LayoutGrid({
    Key? key,
    required this.child,
    required this.showRows,
    required this.showColumns,
    required this.showGrid,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
    this.gridParams = const GridParams(),
  }) : super(key: key);

  final ValueNotifier<bool> showRows;
  final ValueNotifier<bool> showColumns;
  final ValueNotifier<bool> showGrid;

  final ColumnsParams columnsParams;
  final RowsParams rowsParams;
  final GridParams gridParams;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final visibleRows = useListenable(showRows).value;
    final visibleColumns = useListenable(showColumns).value;
    final visibleGrid = useListenable(showGrid).value;

    return Stack(
      children: [
        SizedBox.expand(
          child: child,
        ),
        SafeArea(
          left: rowsParams.safeAreaParams.left,
          bottom: rowsParams.safeAreaParams.bottom,
          top: rowsParams.safeAreaParams.top,
          right: rowsParams.safeAreaParams.right,
          child: Rows(
            visible: visibleRows,
            params: rowsParams,
          ),
        ),
        SafeArea(
          left: columnsParams.safeAreaParams.left,
          bottom: columnsParams.safeAreaParams.bottom,
          top: columnsParams.safeAreaParams.top,
          right: columnsParams.safeAreaParams.right,
          child: Columns(
            visible: visibleColumns,
            params: columnsParams,
          ),
        ),
        SafeArea(
          left: gridParams.safeAreaParams.left,
          bottom: gridParams.safeAreaParams.bottom,
          top: gridParams.safeAreaParams.top,
          right: gridParams.safeAreaParams.right,
          child: Grid(
            visible: visibleGrid,
            params: gridParams,
          ),
        ),
      ],
    );
  }
}
