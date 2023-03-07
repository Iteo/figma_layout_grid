import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LayoutGrid', (tester) async {
    final controller = LayoutGridController();

    await tester.pumpWidget(
      MaterialApp(
        home: LayoutGrid(
          builder: (context) => Container(),
          controller: controller,
        ),
      ),
    );

    expect(find.byKey(const Key('columns')), findsNothing);
    expect(find.byKey(const Key('rows')), findsNothing);
    expect(find.byKey(const Key('grid')), findsNothing);

    controller.showColumns();
    controller.showRows();
    controller.showGrid();

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('columns')), findsOneWidget);
    expect(find.byKey(const Key('rows')), findsOneWidget);
    expect(find.byKey(const Key('grid')), findsOneWidget);

    controller.hideColumns();
    controller.hideRows();
    controller.hideGrid();

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('columns')), findsNothing);
    expect(find.byKey(const Key('rows')), findsNothing);
    expect(find.byKey(const Key('grid')), findsNothing);

    controller.toggleColumns();
    controller.toggleRows();
    controller.toggleGrid();

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('columns')), findsOneWidget);
    expect(find.byKey(const Key('rows')), findsOneWidget);
    expect(find.byKey(const Key('grid')), findsOneWidget);
  });
}
