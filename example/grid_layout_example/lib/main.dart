import 'package:layout_grid_example/grid_config.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridLayout(
        showGridColumns: GridConfig.showGridColumnsNotifier,
        showGridRows: GridConfig.showGridRowsNotifier,
        // safeArea: true,
        rowsParams: const RowsParams(
          // margin: 30,
          offset: 0,
          count: 8,
          gutter: 8,
          height: 8,
          arrangement: Arragement.right,
          // height: 18,
        ),
        columnsParams: const ColumnsParams(
          // offset: 39,
          // offset: 20,
          margin: 20,
          width: 8,
          gutter: 8,
          count: 8,
          arrangement: Arragement.right,
        ),
        child: const MyHomePage(title: 'Figma layout grid'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  value: GridConfig.showGridRowsNotifier.value,
                  onChanged: (value) {
                    GridConfig.showGridRows = value;
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
                  value: GridConfig.showGridColumnsNotifier.value,
                  onChanged: (value) {
                    GridConfig.showGridColumns = value;
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
