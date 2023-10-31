import 'package:flutter/material.dart';

// Define a Category class
class Category {
  // Constructor for the Category class
  const Category({
    required this.id,       // Unique identifier for the category
    required this.title,    // Name or title of the category
    this.color = Colors.orange, // Color associated with the category (default: orange)
  });

  final String id;       // Unique identifier for the category
  final String title;    // Name or title of the category
  final Color color;     // Color associated with the category
}