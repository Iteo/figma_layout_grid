import 'package:figma_layout_grid/src/columns.dart';
import 'package:figma_layout_grid/src/grid.dart';
import 'package:figma_layout_grid/src/layout_grid_controller.dart';
import 'package:figma_layout_grid/src/params.dart';
import 'package:figma_layout_grid/src/rows.dart';
import 'package:flutter/material.dart';

class _DefaultLayoutGridController extends LayoutGridController {}

class LayoutGrid extends StatefulWidget {
  LayoutGrid({
    super.key,
    required this.builder,
    this.columnsParams = const ColumnsParams(),
    this.rowsParams = const RowsParams(),
    this.gridParams = const GridParams(),
    LayoutGridController? controller,
  }) {
    this.controller = controller ?? _DefaultLayoutGridController();
  }

  final ColumnsParams columnsParams;
  final RowsParams rowsParams;
  final GridParams gridParams;

  final Widget Function(BuildContext context) builder;

  late final LayoutGridController controller;

  @override
  State<LayoutGrid> createState() => _LayoutGridState();

  /// This method allows to access and modify [LayoutGrid] parameters
  /// over [BuildContext] within any place in a project.
  ///
  /// If context passed to the this method does not contain the specified widget,
  /// it will throw an error.
  static LayoutGridController of(BuildContext context) {
    final notifier = context
        .dependOnInheritedWidgetOfExactType<LayoutGridNotifier>()
        ?.notifier;
    if (notifier != null) {
      return notifier;
    }
    throw FlutterError(
        'Build context passed to the of method does not contain the specified widget. Ensure that the widget tree contains a widget of the specified type');
  }
}

class _LayoutGridState extends State<LayoutGrid> {
  @override
  void dispose() {
    if (widget.controller is _DefaultLayoutGridController) {
      widget.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutGridNotifier(
      controller: widget.controller,
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
