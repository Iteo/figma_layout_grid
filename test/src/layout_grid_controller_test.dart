import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LayoutGridController', () {
    late LayoutGridController controller;

    setUpAll(() {
      controller = LayoutGridController();
    });

    test('visibility is set to false', () {
      expect(controller.visibleColumns, false);
      expect(controller.visibleRows, false);
      expect(controller.visibleGrid, false);
    });

    test('shows layout', () {
      controller.showColumns();
      controller.showRows();
      controller.showGrid();

      expect(controller.visibleColumns, true);
      expect(controller.visibleRows, true);
      expect(controller.visibleGrid, true);
    });

    test('hides layout', () {
      controller.hideColumns();
      controller.hideRows();
      controller.hideGrid();

      expect(controller.visibleColumns, false);
      expect(controller.visibleRows, false);
      expect(controller.visibleGrid, false);
    });

    test('toggles layout', () {
      controller.toggleColumns();
      controller.toggleRows();
      controller.toggleGrid();

      expect(controller.visibleColumns, true);
      expect(controller.visibleRows, true);
      expect(controller.visibleGrid, true);
    });
  });
}
