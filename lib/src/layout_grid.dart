import 'package:figma_layout_grid/src/columns.dart';
import 'package:figma_layout_grid/src/grid.dart';
import 'package:figma_layout_grid/src/layout_grid_controller.dart';
import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/rows.dart';
import 'package:flutter/material.dart';

class LayoutGrid extends StatefulWidget {
  LayoutGrid({
    super.key,
    required this.builder,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
    this.gridParams = const GridParams(),
    LayoutGridNotifier? notifier,
  }) {
    this.notifier = notifier ?? LayoutGridNotifier();
  }

  final ColumnsParams columnsParams;
  final RowsParams rowsParams;
  final GridParams gridParams;

  final Widget Function(BuildContext context) builder;

  late final LayoutGridNotifier notifier;

  @override
  State<LayoutGrid> createState() => _LayoutGridState();

  static LayoutGridNotifier of(BuildContext context) {
    final notifier = context
        .dependOnInheritedWidgetOfExactType<LayoutGridController>()
        ?.notifier;
    if (notifier != null) {
      return notifier;
    }
    throw UnimplementedError();
  }
}

class _LayoutGridState extends State<LayoutGrid> {
  @override
  void initState() {
    super.initState();
    widget.notifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant LayoutGrid oldWidget) {
    oldWidget.notifier.dispose();
    widget.notifier.addListener(() {
      setState(() {});
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutGridController(
      notifier: widget.notifier,
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              SizedBox.expand(
                child: widget.builder(context),
              ),
              SafeArea(
                left: widget.rowsParams.safeAreaParams.left,
                bottom: widget.rowsParams.safeAreaParams.bottom,
                top: widget.rowsParams.safeAreaParams.top,
                right: widget.rowsParams.safeAreaParams.right,
                child: Rows(
                  visible: LayoutGrid.of(context).visibleRows,
                  params: widget.rowsParams,
                ),
              ),
              SafeArea(
                left: widget.columnsParams.safeAreaParams.left,
                bottom: widget.columnsParams.safeAreaParams.bottom,
                top: widget.columnsParams.safeAreaParams.top,
                right: widget.columnsParams.safeAreaParams.right,
                child: Columns(
                  visible: LayoutGrid.of(context).visibleColumns,
                  params: widget.columnsParams,
                ),
              ),
              SafeArea(
                left: widget.gridParams.safeAreaParams.left,
                bottom: widget.gridParams.safeAreaParams.bottom,
                top: widget.gridParams.safeAreaParams.top,
                right: widget.gridParams.safeAreaParams.right,
                child: Grid(
                  visible: LayoutGrid.of(context).visibleGrid,
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
