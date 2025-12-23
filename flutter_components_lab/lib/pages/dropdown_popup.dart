import 'package:flutter_components_lab/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class DropdownPopup extends StatelessWidget {
  const DropdownPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Dropdown Popup", showBack: true),
      body: Center(
        child: Column(
          children: [
            MyDropDownButton(),
            SizedBox(height: 15),
            MyDropdownButtonFormField(),
            SizedBox(height: 15),
            MyCheckbox(),
            MyCheckboxListTile(),
            MyRadioButton(),
          ],
        ),
      ),
    );
  }
}

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String _selectedCity = 'İstanbul';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Select the city"),
      value: _selectedCity, // value → seçili değer
      borderRadius: BorderRadius.circular(20),
      items: const [
        DropdownMenuItem(value: 'İstanbul', child: Text('İstanbul')),
        DropdownMenuItem(value: 'Ankara', child: Text('Ankara')),
        DropdownMenuItem(value: 'İzmir', child: Text('İzmir')),
        DropdownMenuItem(value: 'Bursa', child: Text('Bursa')),
        DropdownMenuItem(value: 'Eskişehir', child: Text('Eskişehir')),
        DropdownMenuItem(value: 'Trabzon', child: Text('Trabzon')),
      ],
      onChanged: (value) {
        setState(() {
          _selectedCity = value!;
        });
      },
    );
  }
}

class MyDropdownButtonFormField extends StatefulWidget {
  const MyDropdownButtonFormField({super.key});

  @override
  State<MyDropdownButtonFormField> createState() =>
      _MyDropdownButtonFormFieldState();
}

class _MyDropdownButtonFormFieldState extends State<MyDropdownButtonFormField> {
  String _selectedCity = 'İstanbul';

  final List<String> cities = ['İstanbul', 'Ankara', 'İzmir', 'Bursa'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Select the City',
        border: OutlineInputBorder(),
      ),
      value: _selectedCity,
      items: cities
          .map((city) => DropdownMenuItem(value: city, child: Text(city)))
          .toList(),
      onChanged: (value) {
        setState(() => _selectedCity = value!);
      },
    );
  }
}

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        const Text('Dark Mode'),
      ],
    );
  }
}

class MyCheckboxListTile extends StatefulWidget {
  const MyCheckboxListTile({super.key});

  @override
  State<MyCheckboxListTile> createState() => _MyCheckboxListTileState();
}

class _MyCheckboxListTileState extends State<MyCheckboxListTile> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('I accept the notifications.'),
      subtitle: const Text('I would like to receive emails and text messages.'),
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = value!;
        });
      },
    );
  }
}

/*
- Radio.value → her butonun değeri
- groupValue → seçili olan tek state değişkeni
- RadioListTile:
Tek başına satır (ListTile) widget’ıdır
Row içinde kullanılmamalıdır

❌ RadioListTile, CheckboxListTile, ListTile
Row içine konmaz
✅ Bunlar Column / ListView / Scaffold body içinde kullanılır

*/
class MyRadioButton extends StatefulWidget {
  const MyRadioButton({super.key});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  String _selectedGender = 'Kadın';
  String _mode = 'DarkMode';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Kadın',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() => _selectedGender = value!);
              },
            ),
            Text("Kadın"),
            SizedBox(width: 10),
            Radio<String>(
              value: 'Erkek',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() => _selectedGender = value!);
              },
            ),
            Text("Erkek"),
          ],
        ),
        Column(
          children: [
            RadioListTile<String>(
              title: const Text('Light Mode'),
              value: 'LightMode',
              groupValue: _mode,
              onChanged: (value) {
                setState(() => _mode = value!);
              },
            ),
            RadioListTile<String>(
              title: const Text('Dark Mode'),
              value: 'DarkMode',
              groupValue: _mode,
              onChanged: (value) {
                setState(() => _mode = value!);
              },
            ),
          ],
        ),
      ],
    );
  }
}
