import 'package:flutter/material.dart';
import 'package:your_meal_application/screens/categoryMealsScreen.dart';

class CategoryItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  const CategoryItemWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.bgColor}) : super(key: key);

  void selectCategory(BuildContext ctx) {
    /*
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen(
        categoryId: id,
        categoryTitle: title,);
    }));
    */
    Navigator.of(ctx).pushNamed(
        CategoryMealsScreen.routeName,
        arguments: {
          'id' : id,
          'title' : title,
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                bgColor.withOpacity(0.7),
                bgColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight
            ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
