import 'package:flutter/material.dart';
import 'package:ijob_app/widgets/agency_add_form.dart';
import 'package:ijob_app/widgets/list_agency_widget.dart';

class AgencyAdd extends StatelessWidget {
  const AgencyAdd({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agency Add",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AgencyAddForm(),
    );
  }
}
