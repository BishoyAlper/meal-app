import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);


  @override
  _State createState() => _State();
}

class _State extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    //i wanna to amke felter
    displayMeals = widget.availableMeal.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }


  //to increase loading meals item
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _removeMeal(String MealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id==MealId);
    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),
      ),
      //i used builder because i dont need to use map
      body: ListView.builder(
          itemBuilder:(ctx, index){
              return MealItem(
                id: displayMeals[index].id,
                title: displayMeals[index].title,
                imageUrl: displayMeals[index].imageUrl,
                duration: displayMeals[index].duration,
                complexity: displayMeals[index].complexity,
                affordability: displayMeals[index].affordability,
              );
          },
        itemCount: displayMeals.length,

      ),
    );
  }
}
