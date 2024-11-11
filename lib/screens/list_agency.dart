import 'package:flutter/material.dart';
import 'package:ijob_app/screens/agency_add.dart';
import 'package:ijob_app/widgets/list_agency_widget.dart';

class ListAgency extends StatelessWidget {
  const ListAgency({super.key});

  void _addAgency(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AgencyAdd()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Agency",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () => _addAgency(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const ListAgencyWidget(),
    );
  }
}
