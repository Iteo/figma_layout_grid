# Figma layout grid
```figma_layout_grid``` is a Flutter package which imitates Figma's layout grid and all its functionalities. It helps you determine whether your UI components match the design file and align properly. 

## Basic usage

Simply wrap a widget you wish to have layout grid rendered on top with ```LayoutGrid```. Except that you have to pass three required parameters that will indicate what layers have to be shown.


```dart
LayoutGrid(
    showColumns: GridConfig.showColumnsNotifier,
    showRows: GridConfig.showRowsNotifier,
    showGrid: GridConfig.showGridNotifier,
    child: const MyHomePage(),
)
```

Note that you can export ```showColumns```, ```showRows``` and ```showGrid``` parameters to a separate config class just like that.

```dart
class GridConfig {
  static final showColumnsNotifier = ValueNotifier(false);
  static final showRowsNotifier = ValueNotifier(false);
  static final showGridNotifier = ValueNotifier(false);
}
```

## Available layouts
```figma_layout_grid``` supports three types of layout overlays - rows, columns and pixel grid.

### Rows

Horizontal stripes with specified height, gutter, margin, offset, arrangement and color.
There is a possibility for fixed rows count with passing desired number in a ```count``` parameter, otherwise rows are rendered dynamically due to the screen limits. 

Example usage

```dart
LayoutGrid(
  ...
  showRows: GridConfig.showRowsNotifier,
  rowsParams: const RowsParams(
    offset: 32.0,
    height: 16.0,
    gutter: 16.0,
  ),
  child: const MyHomePage(),
),
```
<img src="https://raw.githubusercontent.com/Iteo/figma_layout_grid/implementation/resources/rows.png" alt="rows example image" style="width:300px;"/>

### Columns

Vertical stripes with specified height, gutter, margin, offset, arrangement and color.
There is a possibility for fixed columns count with passing desired number in a ```count``` parameter, otherwise columns are rendered dynamically due to the screen limits. 

Example usage

```dart
LayoutGrid(
  ...
  showColumns: GridConfig.showColumnsNotifier,
  columnsParams: const ColumnsParams(
    count: 4,
    width: 64.0,
    margin: 32.0,
  ),
  child: const MyHomePage(),
),
```

<img src="https://raw.githubusercontent.com/Iteo/figma_layout_grid/implementation/resources/columns.png" alt="columns example image" style="width:300px;"/>

### Grid

Square pixel grid with fixed spacing and color. The thickness of a grid is set to 1.

Example usage

```dart
LayoutGrid(
  ...
  gridParams: const GridParams(
    size: 50.0,
    color: Colors.black26,
  ),
  showGrid: GridConfig.showGridNotifier,
  child: const MyHomePage(),
),
```

<img src="https://raw.githubusercontent.com/Iteo/figma_layout_grid/implementation/resources/grid.png" alt="grid example image" style="width:300px;"/>

## Parametrization

As this package mimics Figma's layout grid features you can directly transfer desired outcome into corresponding parameters. The following example shows columns grid set with count = 10, height = 12, gutter = 12, offset = 24, bottom alignment and some custom color.

<img src="https://raw.githubusercontent.com/Iteo/figma_layout_grid/implementation/resources/figma_config.png" alt="figma layout configuration"/>

Which translates to this piece of code

```dart
LayoutGrid(
  ...
  showRows: GridConfig.showRowsNotifier,
  rowsParams: RowsParams(
    count: 10,
    height: 12.0,
    gutter: 12.0,
    offset: 24.0,
    arrangement: RowsArragement.bottom,
    color: const Color(0xFF757975).withOpacity(0.15),
  ),
  child: const MyHomePage(),
),
```

And finally to the following UI.

<img src="https://raw.githubusercontent.com/Iteo/figma_layout_grid/implementation/resources/custom_config.png" alt="custom config" style="width:300px;"/>

<br>

There is also a possibility to enable ```SafeArea``` for a specific layout.

Each of the three layers has optional ```SafeAreaParams``` within you can pass what SafeArea parts should be handled.
The available options are ```top```, ```bottom```, ```left``` and ```right``` which correspond to SafeArea's parameters with the same names.

By default SafeArea feature is disabled.

```dart
LayoutGrid(
    ...
    rowsParams: const RowsParams(
      safeAreaParams: SafeAreaParams(
        bottom: true,
        top: true,
      ),
    ),
    columnsParams: const ColumnsParams(
      safeAreaParams: SafeAreaParams(
        right: true,
        left: true,
        top: true,
      ),
    ),
    child: const MyHomePage(),
)
```

The above snippet will make the grid overlays avoid the device's intrusions.

<img src="https://raw.githubusercontent.com/Iteo/figma_layout_grid/implementation/resources/safe_area.png" alt="safe area config" style="width:300px;"/>

## Demo

Try out the example app placed in the ```example``` directory. 
