import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/data/dummy_data.dart';

// Define a provider for meals using Riverpod
final mealsProvider = Provider((ref) {
  return dummyMeals; // Return a list of meals from the 'dummy_data.dart' file
});