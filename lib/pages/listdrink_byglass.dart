import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/drink.dart';
import 'package:letsdrink/widgets/drink_grid.dart';
import 'package:letsdrink/widgets/drink_shimmer.dart';

class ListDrinkGlass extends StatefulWidget {
  final String glass;

  ListDrinkGlass(this.glass);

  @override
  _ListDrinkGlassState createState() => _ListDrinkGlassState();
}

class _ListDrinkGlassState extends State<ListDrinkGlass> {
  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.glass,
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
        future: api.getDrinkGlass(widget.glass),
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
