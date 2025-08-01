import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/validation_utils.dart';
import 'package:intl/intl.dart';

class BirthDatePicker extends StatefulWidget {
  final TextEditingController controller;

  const BirthDatePicker({super.key, required this.controller});

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  Validation valid = Validation();
  DateTime? age;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        widget.controller.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            readOnly: true,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Date of Birth',

              border: OutlineInputBorder(),
            ),
          ),
        ),

        // const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
      ],
    );
  }
}
