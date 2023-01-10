import 'package:figma_layout_grid/src/grid.dart';
import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/grid_stripes.dart';
import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    Key? key,
    required this.child,
    required this.showGridRows,
    required this.showGridColumns,
    required this.showGrid,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
    this.gridParams = const GridParams(),
    this.safeArea = false,
  }) : super(key: key);

  final ValueNotifier<bool> showGridRows;
  final ValueNotifier<bool> showGridColumns;
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
              visible: showGridRows,
              params: rowsParams,
            ),
          ),
          SafeArea(
            child: GridStripes(
              visible: showGridColumns,
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
            visible: showGridRows,
            params: rowsParams,
          ),
          GridStripes(
            visible: showGridColumns,
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
