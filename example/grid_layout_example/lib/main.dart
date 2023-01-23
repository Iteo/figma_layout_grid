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
      gridParams: const GridParams(size: 32),
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
                    onChanged: (value) {
                      LayoutGridController.of(context).toggleRows();
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
                    value: LayoutGridController.of(context).visibleColumns,
                    onChanged: (value) {
                      LayoutGridController.of(context).toggleColumns();
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
                    value: LayoutGridController.of(context).visibleGrid,
                    onChanged: (value) {
                      LayoutGridController.of(context).toggleGrid();
                      setState(() {});
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
