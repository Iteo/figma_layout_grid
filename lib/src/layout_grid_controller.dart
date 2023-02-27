import 'package:flutter/widgets.dart';

/// [ChangeNotifier] that stores and allows to manage layout grid data.
class LayoutGridController extends ChangeNotifier {
  bool _visibleRows = false;
  bool _visibleColumns = false;
  bool _visibleGrid = false;

  /// Returns the current row layout visibility state
  bool get visibleRows => _visibleRows;

  /// Returns the current column layout visibility state
  bool get visibleColumns => _visibleColumns;

  /// Returns the current grid layout visibility state
  bool get visibleGrid => _visibleGrid;

  /// Shows row layout and notifies listeners.
  void showRows() {
    _visibleRows = true;
    notifyListeners();
  }

  /// Hides row layout and notifies listeners.
  void hideRows() {
    _visibleRows = false;
    notifyListeners();
  }

  /// Toggles row layout and notifies listeners.
  void toggleRows() {
    _visibleRows = !_visibleRows;
    notifyListeners();
  }

  /// Shows columns layout and notifies listeners.
  void showColumns() {
    _visibleColumns = true;
    notifyListeners();
  }

  /// Hides columns layout and notifies listeners.
  void hideColumns() {
    _visibleColumns = false;
    notifyListeners();
  }

  /// Toggles columns layout and notifies listeners.
  void toggleColumns() {
    _visibleColumns = !_visibleColumns;
    notifyListeners();
  }

  /// Shows grid layout and notifies listeners.
  void showGrid() {
    _visibleGrid = true;
    notifyListeners();
  }

  /// Hides grid layout and notifies listeners.
  void hideGrid() {
    _visibleGrid = false;
    notifyListeners();
  }

  /// Toggles grid layout and notifies listeners.
  void toggleGrid() {
    _visibleGrid = !_visibleGrid;
    notifyListeners();
  }
}

/// This class is responsible for fetching [child]'s state based on [LayoutGridController] changes.
class LayoutGridNotifier extends InheritedNotifier<LayoutGridController> {
  const LayoutGridNotifier({
    super.key,
    required LayoutGridController controller,
    required super.child,
  }) : super(notifier: controller);
}
