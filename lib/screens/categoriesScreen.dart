import 'package:flutter/material.dart';
import 'package:your_meal_application/screens/widgets/categoryItemWidget.dart';

import '../dummyData/categoryDummyData.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItemWidget(
                id: catData.id,
                title: catData.title,
                bgColor: catData.bgColor,
          ),
        ).toList(),
      ),
    );
  }
}
