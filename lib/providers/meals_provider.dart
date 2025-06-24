import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocetak4/models/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
