import 'package:flutter/material.dart';
import 'package:your_meal_application/screens/widgets/mainDrawer.dart';
class FilterScreen extends StatelessWidget {
  static const routeName = '/filterScreen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
      child: Text('Filters!'),
      ),
    );
  }
}
