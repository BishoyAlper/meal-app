import 'package:flutter/material.dart';
import './dummy_data.dart';
import './modules/meal.dart';
import './screns/filter_screen.dart';
import './screns/meal_detail_screen.dart';
import './screns/tabs_screen.dart';
import './screns/category_meals_screen.dart';
import './screns/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  Map<String, bool> _filters= {
    'Gluten' : false,
    'Lactose' : false,
    'Vegan': false,
    'vegitrian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _togglefavorites(String mealId){
    final exitingIndex = _favoriteMeals.indexWhere((meal) => meal.id==mealId );

    if(exitingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(exitingIndex);
      });
    }
    else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  void _setFilters(Map<String, bool> _filterData){
      setState(() {
        _filters = _filterData ;

        _availableMeal = DUMMY_MEALS.where((meal) {
          if(_filters['Gluten'] && meal.isGlutenFree==false){
            return false;
          }
          if(_filters['Lactose'] && meal.isGlutenFree==false)
          {
            return false;
          }
          if(_filters['Vegan'] && meal.isGlutenFree==false){
            return false;
          }
          if(_filters['vegitrian'] && meal.isGlutenFree==false){
            return false;
          }
          return true;
        }).toList();

      });
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          )
      ),
      //home: MyHomePage(),
      //home: CategoryScreen(),
      routes: {
        '/' : (context) => TabScreen(_favoriteMeals),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(_availableMeal),
        MealDetailedScreen.routeName : (context) => MealDetailedScreen(_togglefavorites, _isMealFavorite),
        FilterScreen.routeName : (context) => FilterScreen(_filters, _setFilters),
      },
    );
  }
}


