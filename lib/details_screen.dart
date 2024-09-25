import 'package:flutter/material.dart';
import 'main.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            ...recipe.ingredients.map((ingredient) => Text('• $ingredient')),
            SizedBox(height: 16),
            Text('Instructions:', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}