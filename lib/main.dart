// ignore_for_file: library_private_types_in_public_api

import 'package:add_to_cart/state_builder.dart';
import 'package:flutter/material.dart';

//import 'counter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ColorTogglePage(),
      //home: CounterPage(),
      home: CounterPageB(),
    );
  }
}

class ColorTogglePage extends StatefulWidget {
  const ColorTogglePage({super.key});

  @override
  _ColorTogglePageState createState() => _ColorTogglePageState();
}

class _ColorTogglePageState extends State<ColorTogglePage> {
  Color _backgroundColor = Colors.white;

  void _updateColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Color Toggle'),
        centerTitle: true,
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ColorToggleButton(
            onColorChange: _updateColor,
          ),
        ),
      ),
    );
  }
}

class ColorToggleButton extends StatefulWidget {
  final ValueChanged<Color> onColorChange;

  const ColorToggleButton({super.key, required this.onColorChange});

  @override
  _ColorToggleButtonState createState() => _ColorToggleButtonState();
}

class _ColorToggleButtonState extends State<ColorToggleButton> {
  bool _isBlue = true;

  void _toggleColor() {
    setState(() {
      _isBlue = !_isBlue;
      widget.onColorChange(_isBlue ? Colors.blue : Colors.green);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _toggleColor,
      child: Text(
        _isBlue ? 'Switch to Green' : 'Switch to Blue',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
