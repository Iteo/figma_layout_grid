import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:figma_layout_grid/src/columns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Columns', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Columns(
          visible: true,
          params: ColumnsParams(count: 12),
        ),
      ),
    );

    expect(find.byKey(const Key('columns')), findsOneWidget);
    expect(find.byKey(const Key('column')), findsNWidgets(12));
    expect(find.byKey(const Key('column-gap')), findsNWidgets(11));

    await tester.pumpWidget(
      const MaterialApp(
        home: Columns(
          visible: false,
          params: ColumnsParams(),
        ),
      ),
    );

    expect(find.byKey(const Key('columns')), findsNothing);
    expect(find.byKey(const Key('column')), findsNothing);
    expect(find.byKey(const Key('column-gap')), findsNothing);
  });
}
