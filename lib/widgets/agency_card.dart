import 'package:flutter/material.dart';

class AgencyCard extends StatelessWidget {
  const AgencyCard(
      {super.key,
      this.agencyLogoUrl,
      required this.agencyName,
      this.agencyUrl,
      required this.agencyDescription});
  final String? agencyLogoUrl;
  final String agencyName;
  final String? agencyUrl;
  final String agencyDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              width: 58,
              height: 58,
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  agencyName.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  agencyDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
