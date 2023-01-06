import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/grid_stripes.dart';
import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    Key? key,
    required this.child,
    required this.showGridRows,
    required this.showGridColumns,
    this.safeArea = false,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
  }) : super(key: key);

  final ValueNotifier<bool> showGridRows;
  final ValueNotifier<bool> showGridColumns;

  final ColumnsParams columnsParams;
  final RowsParams rowsParams;

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
        ],
      );
    }
  }
}
