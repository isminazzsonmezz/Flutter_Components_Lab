import 'package:flutter_components_lab/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:fluttertoast/fluttertoast.dart';

class MySelectTheColor extends StatefulWidget {
  const MySelectTheColor({super.key});

  @override
  State<MySelectTheColor> createState() => _MySelectTheColorState();
}

class _MySelectTheColorState extends State<MySelectTheColor> {
  final Map<Color, String> colors = {
    Colors.blue: "Blue",
    Colors.yellow: "Yellow",
    Colors.pink: "Pink",
    Colors.purple: "Purple",
    Colors.red: "Red",
    Colors.black: "Black",
    Colors.green: "Green",
    Colors.grey: "Grey",
  };

  late Color _selectedColor;
  bool isCircular = false;

  @override
  void initState() {
    super.initState();
    _selectedColor = Colors.blue;
  }

  void _RandomSelectColor() {
    final colorsList = colors.keys.toList();

    final randomColor = colorsList[math.Random().nextInt(colorsList.length)];

    setState(() {
      _selectedColor = randomColor;
    });
  }

  void _SnackBarMessage() {
    // Ama Flutter ekibi SnackBar’ı önerir
    /*
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Başarıyla kaydedildi'),
        backgroundColor: Colors.amber,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.fixed,
      ),
    );
    */

    // Android & iOS destekler
    Fluttertoast.showToast(
      msg:
          "RGB: (${_selectedColor.red}, ${_selectedColor.green}, ${_selectedColor.blue})",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: _selectedColor,
      textColor: Colors.white,
      fontSize: 18.0,
    );
  }

  void _circleOrsquare() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Select the Color"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                height: 100,
                width: 100,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  color: _selectedColor,
                  borderRadius: BorderRadius.circular(isCircular ? 100 : 15),
                  boxShadow: [
                    BoxShadow(
                      color: _selectedColor.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(colors[_selectedColor]!),
              SizedBox(height: 15),
              MyDropdownButtonFormFieldColor(
                colors: colors,
                selectedColor: _selectedColor,
                onChanged: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _RandomSelectColor,
                    icon: Icon(Icons.restart_alt_rounded),
                    style: ElevatedButton.styleFrom(iconColor: Colors.black),
                    label: Text(
                      "Random Colour",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: _SnackBarMessage,
                  ),
                  IconButton(
                    icon: isCircular ? Icon(Icons.square_outlined) : Icon(Icons.circle_outlined),
                    onPressed: _circleOrsquare,
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

class MyDropdownButtonFormFieldColor extends StatelessWidget {
  final Map<Color, String> colors;
  final Color selectedColor;
  final ValueChanged<Color> onChanged;

  const MyDropdownButtonFormFieldColor({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        labelText: 'Select the Color',
        border: OutlineInputBorder(),
      ),
      value: selectedColor,
      items: colors.entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key, 
          child: Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: entry.key,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(width: 10,),
              Text(entry.value),
            ],
          ));
      }).toList(),
      onChanged: (color) {
        if (color != null) {
          onChanged(color);
        }
      },
    );
  }
}
