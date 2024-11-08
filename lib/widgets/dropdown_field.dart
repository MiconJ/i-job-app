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
      isExpanded: true,
      value: dropdownValue,
      onChanged: (String? value) {
        if (value != null) {
          ref.read(agencyCategoryProvider.notifier).state =
              agencyCategory.indexOf(value);
        }
      },
      items: agencyCategory.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      buttonStyleData: ButtonStyleData(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          border: Border.all(width: 1.0, color: Colors.grey.shade700),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
      ),
    );
  }
}
