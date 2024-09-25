import 'package:flutter/material.dart';
import 'details_screen.dart';

void main() {
  runApp(RecipeBookApp());
}

class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}

class RecipeBookApp extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Spaghetti Carbonara',
      ingredients: ['Spaghetti', 'Eggs', 'Pancetta', 'Parmesan cheese', 'Black pepper'],
      instructions: 'Cook spaghetti. Mix eggs, cheese, and pepper. Fry pancetta. Combine all ingredients.',
    ),
    Recipe(
      name: 'Chicken Stir Fry',
      ingredients: ['Chicken breast', 'Mixed vegetables', 'Soy sauce', 'Garlic', 'Ginger'],
      instructions: 'Cut chicken into cubes. Stir fry vegetables. Add chicken and sauce. Cook until done.',
    ),
    Recipe(
      name: 'Chicken Alfredo',
      ingredients: [
        'Fettuccine pasta',
        'Chicken breast',
        'Heavy cream',
        'Parmesan cheese',
        'Butter',
        'Garlic',
        'Salt',
        'Black pepper'
      ],
      instructions: '''
          1. Cook fettuccine pasta according to package instructions. Drain and set aside.
          2. Season chicken breast with salt and pepper, then cook in a pan until golden and cooked through. Slice and set aside.
          3. In the same pan, melt butter and sauté minced garlic until fragrant.
          4. Add heavy cream and bring to a simmer. Stir in grated Parmesan cheese until the sauce is smooth.
          5. Add the cooked pasta and sliced chicken to the sauce, tossing to coat evenly. Serve hot with extra Parmesan if desired.
          ''',
    ),
  ];

  RecipeBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(recipes: recipes),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const HomeScreen({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Book'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}