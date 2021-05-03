import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailedScreen extends StatelessWidget {
  static const routeName = 'meals_detail';
  final Function togglefavorites;
  final Function isMealFavorite ;

  MealDetailedScreen(this.togglefavorites, this.isMealFavorite);


  Widget buildSectionTitle(BuildContext ctx, String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(title, style: Theme.of(ctx).textTheme.title,),
    ) ;
  }

  Widget buildContainer(Widget child){
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color:Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectMeal.imageUrl, fit:BoxFit.cover),
            ),
            buildSectionTitle(context, "Ingrediense"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(selectMeal.ingredients[index], style: TextStyle(fontSize: 18),),
                ),
              ),
              itemCount: selectMeal.ingredients.length,
            )),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  child: Text("# ${index +1}"),
                ),
                title: Text(selectMeal.steps[index]),
              ),
              itemCount: selectMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => togglefavorites(mealId),
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
