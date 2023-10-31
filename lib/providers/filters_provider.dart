import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/meals_provider.dart';

// Define an enumeration for filtering options
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

// Define a StateNotifier to manage filter settings
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false
  });

  // Function to set all filter settings
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  // Function to set an individual filter setting
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive
    };
  }
}

// Create a StateNotifierProvider for managing filter settings
final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) => FiltersNotifier());

// Create a provider for filtered meals based on the applied filters
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider); // Obtain a list of meals from another provider
  final activeFilters = ref.watch(filtersProvider); // Obtain the active filter settings

  return meals.where((meal) {
    // Filter meals based on the active filter settings
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList(); // Return the filtered list of meals
});