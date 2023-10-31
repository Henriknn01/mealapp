import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/meals_provider.dart';

import 'package:mealapp/screens/categories.dart';
import 'package:mealapp/screens/filters.dart';
import 'package:mealapp/screens/meal_of_the_day.dart';
import 'package:mealapp/screens/meals.dart';
import 'package:mealapp/widgets/main_drawer.dart';
import 'package:mealapp/providers/favorites_provider.dart';
import 'package:mealapp/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

// Bottom bar, aka Tabs screen
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }
    if (_selectedPageIndex == 2) {
      final meals = ref.read(mealsProvider);
      // select the meal of the day based on the day of the month.
      final mealOfTheDay = ref.watch(mealsProvider)[DateTime.now().day % meals.length];
      // set active page to meal of the day
      activePage = MealOfTheDayScreen(
        meal: mealOfTheDay,
      );
      // set page title
      activePageTitle = 'Meal of the day';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart_rounded),
            label: 'Meal of the day',
          ),
        ],
      ),
    );
  }
}
