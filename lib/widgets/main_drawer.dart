import 'package:flutter/material.dart';
import 'package:meal_app/screns/filter_screen.dart';


class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 20,),
      title: Text(title, style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed'
      ),),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text('cooking up !', style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),),
          ),
          SizedBox(height: 20),
          buildListTile("Meal", Icons.restaurant, (){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),
        ],
      ),
    );
  }
}
