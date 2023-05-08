import 'package:flutter/material.dart';
import 'package:your_meal_application/dummyData/mealsDummyData.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName ='/mealDetail';
  const MealDetailsScreen({Key? key}) : super(key: key);

  Widget BuildSelectionTitle(BuildContext context, String title){
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget BuildContainer(child){
    return Container(
        decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(color: Colors.blueGrey),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final String mealId = args['id'] as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 400,
              width: double.infinity,
              child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
              ),
            ),
            BuildSelectionTitle(context, "Ingredients"),
            BuildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            BuildSelectionTitle(context, "Steps"),
            BuildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index+1}'),
                        ),
                        title: Text(
                            selectedMeal.steps[index]
                        ),
                    ),
                    Divider(height: 1),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
