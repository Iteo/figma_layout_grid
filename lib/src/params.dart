import 'package:flutter/material.dart';

const _defaultColor = Color(0x1AFF0000);

enum RowsArragement {
  stretch,
  top,
  bottom,
  center,
}

enum ColumnsArragement {
  stretch,
  left,
  right,
  center,
}

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

class RowsParams {
  const RowsParams({
    this.gutter = 8.0,
    this.count,
    this.arrangement = RowsArragement.stretch,
    this.offset = 0.0,
    this.margin = 0.0,
    this.height = 8.0,
    this.color = _defaultColor,
    this.safeAreaParams = const SafeAreaParams(),
  });

  final int? count;
  final RowsArragement arrangement;
  final double offset;
  final double margin;
  final double height;
  final double gutter;
  final Color color;
  final SafeAreaParams safeAreaParams;
}

class ColumnsParams {
  const ColumnsParams({
    this.gutter = 16.0,
    this.count,
    this.arrangement = ColumnsArragement.stretch,
    this.offset = 0.0,
    this.margin = 0.0,
    this.width = 16.0,
    this.color = _defaultColor,
    this.safeAreaParams = const SafeAreaParams(),
  });

  final int? count;
  final ColumnsArragement arrangement;
  final double offset;
  final double margin;
  final double width;
  final double gutter;
  final Color color;
  final SafeAreaParams safeAreaParams;
}

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
