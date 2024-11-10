import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ijob_app/models/agency_model.dart';
import 'package:ijob_app/providers/agency_provider.dart';
import 'package:ijob_app/widgets/agency_card.dart';
import 'package:ijob_app/widgets/search_area.dart';

class ListAgencyWidget extends ConsumerWidget {
  const ListAgencyWidget({super.key});

  Future<void> _refreshAgencies(WidgetRef ref) async {
    // Gọi lại provider để làm mới dữ liệu
    ref.refresh(fetchAgencyProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAgencies = ref.watch(fetchAgencyProvider);
    print('List agency call from screen: $listAgencies');

    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchArea(
              titleArea: 'Tìm kiếm nhà tuyển dụng',
              totalAgency: listAgencies.when(
                data: (agencies) => agencies.length,
                loading: () => 0,
                error: (error, stack) => 0,
              )),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 20),
              child: RefreshIndicator(
                onRefresh: () => _refreshAgencies(ref),
                child: listAgencies.when(
                  data: (agencies) {
                    return ListView.builder(
                      itemCount: agencies.length,
                      itemBuilder: (context, index) {
                        final agency = agencies[index];
                        return AgencyCard(
                          agencyName: agency.agencyName,
                          agencyDescription: agency.agencyDescription,
                          agencyUrl: agency.agencyWebsiteUrl ?? '',
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
