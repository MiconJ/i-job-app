import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgencyCard extends StatelessWidget {
  const AgencyCard({
    super.key,
    this.agencyLogoUrl,
    required this.agencyName,
    this.agencyUrl,
    required this.agencyDescription,
  });
  final String? agencyLogoUrl;
  final String agencyName;
  final String? agencyUrl;
  final String agencyDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          print('Click on card');
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                        subtitle: Row(
                          children: [
                            Icon(Icons.web),
                            const SizedBox(
                              width: 4,
                            ),
                            if (agencyUrl != null)
                              InkWell(
                                onTap: () => launchUrl(Uri.parse(agencyUrl!)),
                                child: Text(
                                  agencyUrl!,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  agencyDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
