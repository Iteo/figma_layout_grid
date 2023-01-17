import 'package:flutter/widgets.dart';

class GridConfig {
  static final showGridColumnsNotifier = ValueNotifier(true);
  static bool get showGridColumns => showGridColumnsNotifier.value;
  static set showGridColumns(bool value) =>
      showGridColumnsNotifier.value = value;

  static final showGridRowsNotifier = ValueNotifier(true);
  static bool get showGridRows => showGridRowsNotifier.value;
  static set showGridRows(bool value) => showGridRowsNotifier.value = value;
}
