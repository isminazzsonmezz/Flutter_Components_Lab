import 'package:flutter_components_lab/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class Butons extends StatelessWidget {
  const Butons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: "Buttons", showBack: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      debugPrint("Text Button clicked.");
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.teal),
                    ),
                    child: Text("Text Button"),
                  ),
                  SizedBox(width: 25),
                  TextButton.icon(
                    onPressed: () {
                      debugPrint("TextButton.Icon clicked.");
                    },
                    style: ButtonStyle(
                      iconColor: WidgetStateProperty.all(Colors.black),
                      foregroundColor: WidgetStateProperty.all(Colors.black),
                      backgroundColor: WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return const Color.fromARGB(255, 29, 152, 252);
                        }
                        if (states.contains(WidgetState.hovered)) {
                          return const Color.fromARGB(255, 243, 199, 67);
                        }
                        return Colors.transparent;
                      }),
                    ),
                    icon: Icon(Icons.access_alarm),
                    label: Text("Text Button Icon"),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 245, 114, 74),
                      shadowColor: Colors.black,
                    ),
                    child: Text(
                      "Elevated Button",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle_sharp),
                    style: ElevatedButton.styleFrom(iconColor: Colors.black),
                    label: Text(
                      "Elevated Icon Button",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green.withOpacity(0.7),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Outlined Button"),
                  ),
                  SizedBox(width: 25),
                  OutlinedButton.icon(
                    onPressed: () {
                      debugPrint("Outlined button clicked.");
                    },
                    onLongPress: () {
                      debugPrint("Long Pressed.");
                    },
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.amber, width: 3),
                    ),
                    icon: Icon(Icons.ac_unit_sharp),
                    label: Text("Outlined Icon Button"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "remove_fab",
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
