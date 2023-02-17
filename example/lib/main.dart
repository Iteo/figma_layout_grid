import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      // Pass desired layout parameters or leave it empty if you wish to use the default ones
      gridParams: const GridParams(size: 32),
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
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('figma layout grid'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Rows',
                  ),
                  Switch(
                    value: LayoutGridController.of(context).visibleRows,
                    onChanged: (_) {
                      LayoutGridController.of(context).toggleRows();
                      // No need to use setState here, since InheritedWidget already handles that
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Columns',
                  ),
                  Switch(
                    value: LayoutGridController.of(context).visibleColumns,
                    onChanged: (_) {
                      LayoutGridController.of(context).toggleColumns();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Grid',
                  ),
                  Switch(
                    value: LayoutGridController.of(context).visibleGrid,
                    onChanged: (_) {
                      LayoutGridController.of(context).toggleGrid();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
