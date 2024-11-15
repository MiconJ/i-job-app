import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

class SearchArea extends StatelessWidget {
  const SearchArea({
    super.key,
    required this.totalAgency,
    required this.titleArea,
    required this.onSearch,
  });

  final String titleArea;
  final int totalAgency;
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titleArea.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          print(searchController);
                        },
                        decoration: InputDecoration(
                          hintText: 'Nhập tên nhà tuyển dụng',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    height: 40,
                    child: ActionChip(
                      avatar: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      label: const Text('Tìm kiếm'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onPressed: () {
                        onSearch(searchController.text);
                      },
                      backgroundColor: Theme.of(context).primaryColor,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                'Số lượng Agency: $totalAgency',
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
