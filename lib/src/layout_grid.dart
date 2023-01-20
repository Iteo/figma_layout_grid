import 'package:figma_layout_grid/src/columns.dart';
import 'package:figma_layout_grid/src/grid.dart';
import 'package:figma_layout_grid/src/layout_grid_controller.dart';
import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/rows.dart';
import 'package:flutter/material.dart';

class LayoutGrid extends StatefulWidget {
  const LayoutGrid({
    Key? key,
    required this.child,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
    this.gridParams = const GridParams(),
    this.safeArea = false,
  }) : super(key: key);

  final ColumnsParams columnsParams;
  final RowsParams rowsParams;
  final GridParams gridParams;

  final bool safeArea;

  final Widget child;

  @override
  State<LayoutGrid> createState() => _LayoutGridState();
}

class _LayoutGridState extends State<LayoutGrid> {
  late LayoutGridController controller;

  @override
  void initState() {
    controller = LayoutGridController();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutGridNotifier(
      controller: controller,
      child: Builder(
        builder: (innerContext) {
          return Stack(
            children: [
              SizedBox.expand(
                child: widget.child,
              ),
              SafeArea(
                left: widget.safeArea,
                bottom: widget.safeArea,
                top: widget.safeArea,
                right: widget.safeArea,
                child: Rows(
                  visible: LayoutGridNotifier.of(innerContext).visibleRows,
                  params: widget.rowsParams,
                ),
              ),
              SafeArea(
                left: widget.safeArea,
                bottom: widget.safeArea,
                top: widget.safeArea,
                right: widget.safeArea,
                child: Columns(
                  visible: LayoutGridNotifier.of(innerContext).visibleColumns,
                  params: widget.columnsParams,
                ),
              ),
              SafeArea(
                left: widget.safeArea,
                bottom: widget.safeArea,
                top: widget.safeArea,
                right: widget.safeArea,
                child: Grid(
                  visible: LayoutGridNotifier.of(innerContext).visibleGrid,
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
