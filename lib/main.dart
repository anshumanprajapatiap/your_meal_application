import 'package:flutter/material.dart';
import 'package:your_meal_application/screens/categoriesScreen.dart';
import 'package:your_meal_application/screens/categoryMealsScreen.dart';
import 'package:your_meal_application/screens/filtterScreen.dart';
import 'package:your_meal_application/screens/mealDetailsScreen.dart';
import 'package:your_meal_application/screens/tabsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.pink,
        canvasColor: const Color.fromRGBO(185, 185, 185, 1.0),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ))
      ),
      //home: const CategoriesScreen(),
      //initialRoute: '/', //default value
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if(settings.name == '/meal-detail'){
        //   return ...;
        // }
        // else{
        //   return ...;
        // }
        //return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}