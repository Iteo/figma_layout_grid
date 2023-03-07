import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:figma_layout_grid/src/grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Columns', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Grid(
          visible: true,
          params: GridParams(),
        ),
      ),
    );

    expect(find.byKey(const Key('grid')), findsOneWidget);

    await tester.pumpWidget(
      const MaterialApp(
        home: Grid(
          visible: false,
          params: GridParams(),
        ),
      ),
    );

    expect(find.byKey(const Key('grid')), findsNothing);
  });
}
