import 'package:flutter/material.dart';

enum Arragement {
  stretch,
  left,
  right,
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
    this.count,
    this.arrangement = Arragement.stretch,
    this.offset = 0,
    this.margin = 0,
    this.height = 8,
    this.gutter = 8,
    this.color = const Color(0x1AFF0000),
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

  final int? count;
  final Arragement arrangement;
  final double offset;
  final double margin;
  final double height;
  final double gutter;
  final Color color;
}

class ColumnsParams extends StripesParams {
  const ColumnsParams({
    this.count,
    this.arrangement = Arragement.stretch,
    this.offset = 0,
    this.margin = 0,
    this.width = 16,
    this.gutter = 16,
    this.color = const Color(0x1AFF0000),
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

  final int? count;
  final Arragement arrangement;
  final double offset;
  final double margin;
  final double width;
  final double gutter;
  final Color color;
}
