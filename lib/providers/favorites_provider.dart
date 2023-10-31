import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/models/meal.dart';


// Define a StateNotifier to manage a list of favorite meals
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // Initialize with an empty list of meals

  // Function to toggle the favorite status of a meal
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // If the meal is already a favorite, remove it from the list
      state = state.where((m) => m.id != meal.id).toList();
      return false; // Indicate that the meal is no longer a favorite
    } else {
      // If the meal is not a favorite, add it to the list
      state = [...state, meal];
      return true; // Indicate that the meal is now a favorite
    }
  }
}

// Create a StateNotifierProvider for managing favorite meals
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});