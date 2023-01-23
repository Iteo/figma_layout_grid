import 'package:flutter/widgets.dart';

class LayoutGridController extends ChangeNotifier {
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

class LayoutGridNotifier extends InheritedNotifier<LayoutGridController> {
  const LayoutGridNotifier({
    Key? key,
    required LayoutGridController controller,
    required Widget child,
  }) : super(
          key: key,
          notifier: controller,
          child: child,
        );

  static LayoutGridController of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<LayoutGridNotifier>()
          ?.notifier ??
      LayoutGridController();
}