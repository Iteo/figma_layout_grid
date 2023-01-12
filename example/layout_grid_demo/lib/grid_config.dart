import 'package:flutter/widgets.dart';

class GridConfig {
  static final showColumnsNotifier = ValueNotifier(false);
  static bool get showColumns => showColumnsNotifier.value;
  static set showColumns(bool value) => showColumnsNotifier.value = value;

  static final showRowsNotifier = ValueNotifier(false);
  static bool get showRows => showRowsNotifier.value;
  static set showRows(bool value) => showRowsNotifier.value = value;

  static final showGridNotifier = ValueNotifier(false);
  static bool get showGrid => showGridNotifier.value;
  static set showGrid(bool value) => showGridNotifier.value = value;
}
