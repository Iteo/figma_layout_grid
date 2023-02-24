import 'package:flutter/widgets.dart';

class LayoutGridNotifier extends ChangeNotifier {
  bool _visibleRows = false;
  bool get visibleRows => _visibleRows;

  bool _visibleColumns = false;
  bool get visibleColumns => _visibleColumns;

  bool _visibleGrid = false;
  bool get visibleGrid => _visibleGrid;

  void showRows() {
    _visibleRows = true;
    notifyListeners();
  }

  void hideRows() {
    _visibleRows = false;
    notifyListeners();
  }

  void toggleRows() {
    _visibleRows = !_visibleRows;
    notifyListeners();
  }

  void showColumns() {
    _visibleColumns = true;
    notifyListeners();
  }

  void hideColumns() {
    _visibleColumns = false;
    notifyListeners();
  }

  void toggleColumns() {
    _visibleColumns = !_visibleColumns;
    notifyListeners();
  }

  void showGrid() {
    _visibleGrid = true;
    notifyListeners();
  }

  void hideGrid() {
    _visibleGrid = false;
    notifyListeners();
  }

  void toggleGrid() {
    _visibleGrid = !_visibleGrid;
    notifyListeners();
  }
}

class LayoutGridController extends InheritedNotifier<LayoutGridNotifier> {
  const LayoutGridController({
    super.key,
    required LayoutGridNotifier super.notifier,
    required super.child,
  });
}
