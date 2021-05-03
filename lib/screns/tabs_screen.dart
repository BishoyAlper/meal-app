import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals) ;

  @override
  _State createState() => _State();
}

class _State extends State<TabScreen> {
  List<Map<String, Object>> _Pages;
  int _selectPagesIndex = 0;

  @override
  void initState() {
    _Pages = [
    {
    'page': CategoryScreen(),
    'title': 'Categories',
    },
    {
    'page': FavoriteScreen(widget.favoriteMeals),
    'title': 'Your Favorties',
    },
    ];
    super.initState();
  }

  void _selectPages(int value) {
    setState(() {
      _selectPagesIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_Pages[_selectPagesIndex]['title']),),
      body: _Pages[_selectPagesIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPages,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPagesIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

}
