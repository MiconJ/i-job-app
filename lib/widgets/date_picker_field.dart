import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.valueText,
  });

  final String title;
  final String valueText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _dateController =
        TextEditingController(text: valueText);

    return Column(
      children: [
        TextFormField(
          controller: _dateController,
          decoration: InputDecoration(
            label: Text(title),
            filled: false,
            prefixIcon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onTap: onTap,
          readOnly: true,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
