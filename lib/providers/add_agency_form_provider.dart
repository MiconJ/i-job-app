import 'package:flutter_riverpod/flutter_riverpod.dart';

final extablishedAtProvider = StateProvider<DateTime>((Ref) {
  return DateTime.now();
});

final agencyCategoryProvider = StateProvider<int>((Ref) {
  return 0;
});