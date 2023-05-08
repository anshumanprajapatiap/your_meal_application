import 'package:flutter/material.dart';
import 'package:your_meal_application/screens/widgets/mealItemWidget.dart';

import '../dummyData/mealsDummyData.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen({Key? key,
  //   required this.categoryId,
  //   required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemBuilder: (ctx, index) {
            return MealItemWidget(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability
            );
          },
          itemCount: categoryMeals.length,
        )
      ),
    );
  }
}
