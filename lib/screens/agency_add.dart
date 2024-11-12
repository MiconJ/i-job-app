import 'package:flutter/material.dart';
import 'package:ijob_app/widgets/agency_add_form.dart';
import 'package:ijob_app/widgets/list_agency_widget.dart';

class AgencyAdd extends StatelessWidget {
  const AgencyAdd({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Thêm mới Agency",
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AgencyAddForm(),
    );
  }
}
