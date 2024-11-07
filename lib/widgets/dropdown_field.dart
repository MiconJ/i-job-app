import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/providers/add_agency_form_provider.dart';

class DropdownField extends ConsumerWidget {
  const DropdownField({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> agencyCategory = [
      'Công ty tuyển dụng',
      'Công ty thường',
    ];
    final int agencyCategoryValue = ref.watch(agencyCategoryProvider);
    String dropdownValue = agencyCategory[agencyCategoryValue];

    return DropdownButton2(
      value: dropdownValue,
      onChanged: (String? value) {
        if (value != null) {}
      },
      items: agencyCategory.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black, // Màu chữ item
            ),
          ),
        );
      }).toList(),
      buttonStyleData: const ButtonStyleData(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white, // Màu nền của dropdown button
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color:
              Theme.of(context).secondaryHeaderColor, // Màu nền menu dropdown
        ),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
