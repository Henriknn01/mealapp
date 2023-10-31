// Define an enumeration for meal complexity levels
enum Complexity {
  simple,       // Easy to prepare
  challenging,  // Requires some cooking skills
  hard,         // Complex and time-consuming
}

// Define an enumeration for meal affordability levels
enum Affordability {
  affordable,   // Budget-friendly
  pricey,       // Moderately expensive
  luxurious,    // High-end and expensive
}

// Define a Meal class
class Meal {
  const Meal({
    required this.id,              // Unique identifier for the meal
    required this.categories,      // List of category names the meal belongs to
    required this.title,           // Name or title of the meal
    required this.imageUrl,        // URL of the meal's image
    required this.ingredients,     // List of ingredients used in the meal
    required this.steps,           // List of cooking steps or instructions
    required this.duration,        // Cooking duration in minutes
    required this.complexity,      // Complexity level of the meal (from the Complexity enum)
    required this.affordability,   // Affordability level of the meal (from the Affordability enum)
    required this.isGlutenFree,    // Indicates if the meal is gluten-free
    required this.isLactoseFree,   // Indicates if the meal is lactose-free
    required this.isVegan,         // Indicates if the meal is vegan
    required this.isVegetarian,    // Indicates if the meal is vegetarian
  });

  final String id;                 // Unique identifier for the meal
  final List<String> categories;   // List of category names the meal belongs to
  final String title;              // Name or title of the meal
  final String imageUrl;           // URL of the meal's image
  final List<String> ingredients;  // List of ingredients used in the meal
  final List<String> steps;        // List of cooking steps or instructions
  final int duration;              // Cooking duration in minutes
  final Complexity complexity;     // Complexity level of the meal
  final Affordability affordability; // Affordability level of the meal
  final bool isGlutenFree;         // Indicates if the meal is gluten-free
  final bool isLactoseFree;        // Indicates if the meal is lactose-free
  final bool isVegan;              // Indicates if the meal is vegan
  final bool isVegetarian;         // Indicates if the meal is vegetarian
}