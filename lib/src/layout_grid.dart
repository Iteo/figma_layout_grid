import 'package:figma_layout_grid/src/columns.dart';
import 'package:figma_layout_grid/src/grid.dart';
import 'package:figma_layout_grid/src/layout_grid_controller.dart';
import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/rows.dart';
import 'package:flutter/material.dart';

class LayoutGrid extends StatefulWidget {
  const LayoutGrid({
    super.key,
    required this.builder,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
    this.gridParams = const GridParams(),
  });

  final ColumnsParams columnsParams;
  final RowsParams rowsParams;
  final GridParams gridParams;

  final Widget Function(BuildContext context) builder;

  @override
  State<LayoutGrid> createState() => _LayoutGridState();
}

class _LayoutGridState extends State<LayoutGrid> {
  late LayoutGridController controller;

  @override
  void initState() {
    super.initState();
    controller = LayoutGridController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutGridScope(
      controller: controller,
      child: Builder(
        builder: (innerContext) {
          return Stack(
            children: [
              SizedBox.expand(
                child: widget.builder(innerContext),
              ),
              SafeArea(
                left: widget.rowsParams.safeAreaParams.left,
                bottom: widget.rowsParams.safeAreaParams.bottom,
                top: widget.rowsParams.safeAreaParams.top,
                right: widget.rowsParams.safeAreaParams.right,
                child: Rows(
                  visible: LayoutGridController.of(innerContext).visibleRows,
                  params: widget.rowsParams,
                ),
              ),
              SafeArea(
                left: widget.columnsParams.safeAreaParams.left,
                bottom: widget.columnsParams.safeAreaParams.bottom,
                top: widget.columnsParams.safeAreaParams.top,
                right: widget.columnsParams.safeAreaParams.right,
                child: Columns(
                  visible: LayoutGridController.of(innerContext).visibleColumns,
                  params: widget.columnsParams,
                ),
              ),
              SafeArea(
                left: widget.gridParams.safeAreaParams.left,
                bottom: widget.gridParams.safeAreaParams.bottom,
                top: widget.gridParams.safeAreaParams.top,
                right: widget.gridParams.safeAreaParams.right,
                child: Grid(
                  visible: LayoutGridController.of(innerContext).visibleGrid,
                  params: widget.gridParams,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
