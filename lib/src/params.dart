import 'package:flutter/material.dart';

enum Arragement {
  stretch,
  left,
  right,
  top,
  bottom,
  center,
}

abstract class StripesParams {
  const StripesParams({
    required this.axis,
    required this.gutter,
    required this.count,
    required this.arrangement,
    required this.offset,
    required this.margin,
    required this.size,
    required this.color,
  });

  final Axis axis;
  final int? count;
  final Arragement arrangement;
  final double offset;
  final double margin;
  final double size;
  final double gutter;
  final Color color;
}

class RowsParams extends StripesParams {
  const RowsParams({
    int? count,
    Arragement arrangement = Arragement.stretch,
    double offset = 0.0,
    double margin = 0.0,
    double height = 8.0,
    double gutter = 8.0,
    Color color = const Color(0x1AFF0000),
  }) : super(
          axis: Axis.vertical,
          count: count,
          arrangement: arrangement,
          offset: offset,
          margin: margin,
          size: height,
          gutter: gutter,
          color: color,
        );
}

class ColumnsParams extends StripesParams {
  const ColumnsParams({
    int? count,
    Arragement arrangement = Arragement.stretch,
    double offset = 0.0,
    double margin = 0.0,
    double width = 16.0,
    double gutter = 16.0,
    Color color = const Color(0x1AFF0000),
  }) : super(
          axis: Axis.horizontal,
          count: count,
          arrangement: arrangement,
          offset: offset,
          margin: margin,
          size: width,
          gutter: gutter,
          color: color,
        );
}
