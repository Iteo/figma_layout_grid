import 'package:figma_layout_grid/src/grid.dart';
import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/grid_stripes.dart';
import 'package:flutter/material.dart';

class LayoutGrid extends StatelessWidget {
  const LayoutGrid({
    Key? key,
    required this.child,
    required this.showRows,
    required this.showColumns,
    required this.showGrid,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
    this.gridParams = const GridParams(),
    this.safeArea = false,
  }) : super(key: key);

  final ValueNotifier<bool> showRows;
  final ValueNotifier<bool> showColumns;
  final ValueNotifier<bool> showGrid;

  final ColumnsParams columnsParams;
  final RowsParams rowsParams;
  final GridParams gridParams;

  final bool safeArea;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (safeArea) {
      return Stack(
        children: [
          SizedBox.expand(
            child: child,
          ),
          SafeArea(
            child: GridStripes(
              visible: showRows,
              params: rowsParams,
            ),
          ),
          SafeArea(
            child: GridStripes(
              visible: showColumns,
              params: columnsParams,
            ),
          ),
          SafeArea(
            child: Grid(
              visible: showGrid,
              params: gridParams,
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          SizedBox.expand(
            child: child,
          ),
          GridStripes(
            visible: showRows,
            params: rowsParams,
          ),
          GridStripes(
            visible: showColumns,
            params: columnsParams,
          ),
          Grid(
            visible: showGrid,
            params: gridParams,
          ),
        ],
      );
    }
  }
}
