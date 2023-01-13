import 'package:figma_layout_grid/figma_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:layout_grid_example/grid_config.dart';

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
      home: LayoutGrid(
        showColumns: GridConfig.showColumnsNotifier,
        showRows: GridConfig.showRowsNotifier,
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
        showGrid: GridConfig.showGridNotifier,
        child: const MyHomePage(),
      ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('figma_layout_grid'),
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
                  value: GridConfig.showRowsNotifier.value,
                  onChanged: (value) {
                    GridConfig.showRows = value;
                    setState(() {});
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
                  value: GridConfig.showColumnsNotifier.value,
                  onChanged: (value) {
                    GridConfig.showColumns = value;
                    setState(() {});
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
                  value: GridConfig.showGridNotifier.value,
                  onChanged: (value) {
                    GridConfig.showGrid = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
