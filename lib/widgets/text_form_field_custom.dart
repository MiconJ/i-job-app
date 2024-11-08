import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFormFieldCustom extends ConsumerWidget {
  const TextFormFieldCustom({
    super.key,
    required this.hintText,
    required this.labelText,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
  });

  final String hintText;
  final String labelText;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
            labelText: labelText,
            hintMaxLines: 1,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          onChanged: onChanged,
          validator: validator,
          maxLines: maxLines,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
