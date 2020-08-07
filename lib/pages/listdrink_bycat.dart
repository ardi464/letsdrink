import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/drink.dart';
import 'package:letsdrink/widgets/drink_grid.dart';
import 'package:letsdrink/widgets/drink_shimmer.dart';

class ListDrinkCat extends StatefulWidget {
  final String category;

  ListDrinkCat(this.category);

  @override
  _ListDrinkCatState createState() => _ListDrinkCatState();
}

class _ListDrinkCatState extends State<ListDrinkCat> {
  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _bodyListDrink(context),
    );
  }

  Widget _bodyListDrink(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<DrinksData>(
        future: api.getDrinkCat(widget.category),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return DrinkGrid(snapshot);
          }
          return DrinkShimmer();
        },
      ),
    );
  }
}
