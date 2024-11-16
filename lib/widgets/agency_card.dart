import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/providers/agency_provider.dart';
import 'package:ijob_app/screens/agency_detail.dart';
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

  void _viewAgencyDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AgencyDetail()),
    );
  }

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
          _viewAgencyDetail(context);
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
                            'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
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
