import 'package:flutter/material.dart';
import 'package:ijob_app/widgets/agency_detail_widget.dart';

class AgencyDetail extends StatelessWidget {
  const AgencyDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Chi tiết nhà tuyển dụng',
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AgencyDetailWidget(),
    );
  }
}
