import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Params', () {
    late SafeAreaParams safeAreaParams;
    late RowsParams rowsParams;
    late ColumnsParams columnsParams;
    late GridParams gridParams;

    setUpAll(() {
      safeAreaParams = const SafeAreaParams();
      rowsParams = const RowsParams();
      columnsParams = const ColumnsParams();
      gridParams = const GridParams();
    });

    test('SafeAreaParams default values', () {
      expect(safeAreaParams.top, false);
      expect(safeAreaParams.bottom, false);
      expect(safeAreaParams.left, false);
      expect(safeAreaParams.right, false);
    });

    test('RowsParams default values', () {
      expect(rowsParams.gutter, 8.0);
      expect(rowsParams.count, null);
      expect(rowsParams.arrangement, RowsArrangement.stretch);
      expect(rowsParams.offset, 0.0);
      expect(rowsParams.margin, 0.0);
      expect(rowsParams.height, 8.0);
      expect(rowsParams.color, const Color(0x1AFF0000));
      expect(rowsParams.safeAreaParams, safeAreaParams);
    });

    test('ColumnsParams default values', () {
      expect(columnsParams.gutter, 16.0);
      expect(columnsParams.count, null);
      expect(columnsParams.arrangement, ColumnsArrangement.stretch);
      expect(columnsParams.offset, 0.0);
      expect(columnsParams.margin, 0.0);
      expect(columnsParams.width, 16.0);
      expect(columnsParams.color, const Color(0x1AFF0000));
      expect(columnsParams.safeAreaParams, safeAreaParams);
    });

    test('GridParams default values', () {
      expect(gridParams.size, 32.0);
      expect(gridParams.color, const Color(0x1AFF0000));
      expect(gridParams.safeAreaParams, safeAreaParams);
    });

    test('RowsArrangement values', () {
      expect(RowsArrangement.values, [
        RowsArrangement.stretch,
        RowsArrangement.top,
        RowsArrangement.bottom,
        RowsArrangement.center,
      ]);
    });

    test('ColumnsArrangement values', () {
      expect(ColumnsArrangement.values, [
        ColumnsArrangement.stretch,
        ColumnsArrangement.left,
        ColumnsArrangement.right,
        ColumnsArrangement.center,
      ]);
    });
  });
}
