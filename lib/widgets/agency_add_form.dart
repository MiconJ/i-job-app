import 'package:flutter/material.dart';

class AgencyAddForm extends StatelessWidget {
  const AgencyAddForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'What do people call you?',
                labelText: 'Name *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            )
          ],
        )),
      ),
    );
  }
}
