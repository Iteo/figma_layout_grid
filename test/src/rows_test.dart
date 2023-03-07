import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:figma_layout_grid/src/rows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Rows', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Rows(
          visible: true,
          params: RowsParams(count: 12),
        ),
      ),
    );

    expect(find.byKey(const Key('rows')), findsOneWidget);
    expect(find.byKey(const Key('row')), findsNWidgets(12));
    expect(find.byKey(const Key('row-gap')), findsNWidgets(11));

    await tester.pumpWidget(
      const MaterialApp(
        home: Rows(
          visible: false,
          params: RowsParams(),
        ),
      ),
    );

    expect(find.byKey(const Key('rows')), findsNothing);
    expect(find.byKey(const Key('row')), findsNothing);
    expect(find.byKey(const Key('row-gap')), findsNothing);
  });
}
