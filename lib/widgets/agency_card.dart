import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/providers/agency_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AgencyCard extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final accessToken = ref.watch(accessTokenProvider);
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
                    SizedBox(
                      width: 58,
                      height: 58,
                      child: Image.network(
                        agencyLogoUrl ??
                            'https://ijob2e0d21e958c684e51b22b5c052c9363e3edf11-dev.s3.ap-southeast-1.amazonaws.com/public/logo-syp-talents-1.png',
                        width: 58,
                        height: 58,
                        headers:
                            accessToken != null ? {'Authorization': ''} : {},
                      ),
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
