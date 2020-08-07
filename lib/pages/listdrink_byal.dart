import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/drink.dart';
import 'package:letsdrink/widgets/drink_grid.dart';
import 'package:letsdrink/widgets/drink_shimmer.dart';

class ListDrinkAlcohol extends StatefulWidget {
  final String alcohol;

  ListDrinkAlcohol(this.alcohol);

  @override
  _ListDrinkAlcoholState createState() => _ListDrinkAlcoholState();
}

class _ListDrinkAlcoholState extends State<ListDrinkAlcohol> {
  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.alcohol,
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
        future: api.getDrinkAlcohol(widget.alcohol),
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
