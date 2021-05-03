import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Function saveFilters;
  Map<String, bool> curentfilters;

  FilterScreen(this.curentfilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  initState(){
    _GlutenFree = widget.curentfilters['Gluten'];
    _LactoseFree = widget.curentfilters['Lactose'];
    _Vegan = widget.curentfilters['Vegan'];
    _Vegetarian = widget.curentfilters['vegitrian'];

    super.initState();
  }

  Widget buildLitstTile(String title, String subtitle, bool currentValue , Function updateValue){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your Favorite"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed:(){
              final Map<String, bool> selectFilters = {
                'Gluten' : _GlutenFree,
                'Lactose' : _LactoseFree,
                'Vegan': _Vegan,
                'vegitrian': _Vegetarian,
              };
              widget.saveFilters(selectFilters);
            }
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjuct your meal selection", style: Theme.of(context).textTheme.title,),
          ),
          //bastaghel b2et elsaf7a
          Expanded(
            child: ListView(
              children: [
                buildLitstTile(
                    'Glutten-Free', 'Only include glutten-free', _GlutenFree,
                    (newValue) {
                  setState(() {
                    _GlutenFree = newValue;
                  });
                }),

                buildLitstTile(
                    'Lactose-Free', 'Only include Lactose-free', _LactoseFree,
                        (newValue) {
                      setState(() {
                        _LactoseFree = newValue;
                      });
                    }),

                buildLitstTile(
                    'vegan', 'Only include vegan', _Vegan,
                        (newValue) {
                      setState(() {
                        _Vegan = newValue;
                      });
                    }),

                buildLitstTile(
                    'vegitian', 'Only include vegitirian', _Vegetarian,
                        (newValue) {
                      setState(() {
                        _Vegetarian = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),

      drawer: MainDrawer(),
    );

  }
}
