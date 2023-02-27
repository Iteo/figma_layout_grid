import 'package:flutter/material.dart';

const _defaultColor = Color(0x1AFF0000);

/// Describes the way how to arrange layout rows.
///
/// Use [stretch] to render equally specified numbers of rows throughout the whole device height
/// Use [top] to render rows starting from the top
/// Use [bottom] to render rows starting from the bottom
/// Use [center] to render rows starting from the center, symmetrically
enum RowsArrangement {
  stretch,
  top,
  bottom,
  center,
}

/// Describes the way how to arrange layout columns.
///
/// Use [stretch] to render equally specified number of columns throughout the whole device width
/// Use [top] to render columns starting from the left side
/// Use [bottom] to render columns starting from the right side
/// Use [center] to render columns starting from the center, symmetrically
enum ColumnsArrangement {
  stretch,
  left,
  right,
  center,
}

/// Provides information whether to avoid system intrusions.
///
/// [top], [bottom], [left], [right] arguments correspond to [SafeArea] arguments
/// with the same names. By default all of them are set to false.
class SafeAreaParams {
  const SafeAreaParams({
    this.top = false,
    this.bottom = false,
    this.left = false,
    this.right = false,
  });

  final bool top;
  final bool bottom;
  final bool left;
  final bool right;
}

/// Combines all the parameters concerning layout rows.
///
/// [gutter] is a constant gap between all of the rows.
/// When [count] is given, only that particular number of rows is rendered.
/// If [count] is null, numbers of rows is limited only due to screen's height.
/// [arrangement] parameter describes the way how to arrange rows. For more details see [RowsArrangement].
/// [offset] parameter makes sure that the layout is rendered after given number of pixels.
/// It is valid only when [arrangement] is set to [RowsArrangement.bottom] or [RowsArrangement.top].
/// [margin] parameter ensures that there are equal gaps from both top and bottom.
/// It applies only when [arrangement] is set to [RowsArrangement.stretch].
/// [height] is a height of a single row. Does not apply when [arrangement] is set to [RowsArrangement.stretch].
/// To set rows color, pass it via Color [color] parameter (by default set to Color(0x1AFF0000)).
/// [safeAreaParams] allows to avoid system obstacles. For more details see [SafeAreaParams].
class RowsParams {
  const RowsParams({
    this.gutter = 8.0,
    this.count,
    this.arrangement = RowsArrangement.stretch,
    this.offset = 0.0,
    this.margin = 0.0,
    this.height = 8.0,
    this.color = _defaultColor,
    this.safeAreaParams = const SafeAreaParams(),
  });

  final int? count;
  final RowsArrangement arrangement;
  final double offset;
  final double margin;
  final double height;
  final double gutter;
  final Color color;
  final SafeAreaParams safeAreaParams;
}

/// Combines all the parameters concerning layout columns.
///
/// [gutter] is a constant gap between all of the columns.
/// When [count] is given, only that particular number of columns is rendered.
/// If [count] is null, numbers of columns is limited only due to screen's width.
/// [arrangement] parameter describes the way how to arrange columns. For more details see [ColumnsArrangement].
/// [offset] parameter makes sure that the layout is rendered after given number of pixels.
/// It is valid only when [arrangement] is set to [ColumnsArrangement.bottom] or [ColumnsArrangement.top].
/// [margin] parameter ensures that there are equal gaps from both left and right.
/// It applies only when [arrangement] is set to [ColumnsArrangement.stretch].
/// [width] is a width of a single column. Does not apply when [arrangement] is set to [ColumnsArrangement.stretch].
/// To set columns color, pass it via Color [color] parameter (by default set to Color(0x1AFF0000)).
/// [safeAreaParams] allows to avoid system obstacles. For more details see [SafeAreaParams].
class ColumnsParams {
  const ColumnsParams({
    this.gutter = 16.0,
    this.count,
    this.arrangement = ColumnsArrangement.stretch,
    this.offset = 0.0,
    this.margin = 0.0,
    this.width = 16.0,
    this.color = _defaultColor,
    this.safeAreaParams = const SafeAreaParams(),
  });

  final int? count;
  final ColumnsArrangement arrangement;
  final double offset;
  final double margin;
  final double width;
  final double gutter;
  final Color color;
  final SafeAreaParams safeAreaParams;
}

/// Combines all the parameters concerning layout grid.
///
/// [size] is a distance (in pixels) between the lines in the grid.
/// To set grid color, pass it via Color [color] parameter (by default set to Color(0x1AFF0000)).
/// [safeAreaParams] allows to avoid system obstacles. For more details see [SafeAreaParams].
class GridParams {
  const GridParams({
    this.size = 32.0,
    this.color = _defaultColor,
    this.safeAreaParams = const SafeAreaParams(),
  });

  final double size;
  final Color color;
  final SafeAreaParams safeAreaParams;
}
