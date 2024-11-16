import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/models/agency_model.dart';
import 'package:ijob_app/providers/agency_provider.dart';
import 'package:ijob_app/widgets/agency_card.dart';
import 'package:ijob_app/widgets/search_area.dart';

class ListAgencyWidget extends ConsumerWidget {
  const ListAgencyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAgencies = ref.watch(searchAgenciesProvider);
    print('List agency call from screen: $listAgencies');

    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchArea(
            titleArea: 'Tìm kiếm nhà tuyển dụng',
            totalAgency: listAgencies.length,
            onSearch: (query) {
              ref.refresh(fetchAgencyProvider);
              ref.watch(searchAgenciesProvider.notifier).searchAgencies(query);
            },
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 20),
              child: listAgencies.isEmpty
                  ? const Center(
                      child: Text(
                        'Không có dữ liệu hợp lệ',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  : ListView.builder(
                      itemCount: listAgencies.length,
                      itemBuilder: (context, index) {
                        final agency = listAgencies[index];
                        return AgencyCard(
                          agencyName: agency.agencyName,
                          agencyDescription: agency.agencyDescription,
                          agencyUrl: agency.agencyWebsiteUrl ?? '',
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
