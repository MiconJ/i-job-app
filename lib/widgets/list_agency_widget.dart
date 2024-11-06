import 'package:flutter/material.dart';
import 'package:ijob_app/widgets/agency_card.dart';

class ListAgencyWidget extends StatefulWidget {
  const ListAgencyWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ListAgencyWidget();
  }
}

class _ListAgencyWidget extends State<ListAgencyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('List agency'),
        AgencyCard(
            agencyName: 'TrungND Agency Name',
            agencyDescription:
                'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'),
      ],
    );
  }
}
