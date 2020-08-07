import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/drink.dart';
import 'package:letsdrink/pages/listdrink_byal.dart';
import 'package:letsdrink/pages/listdrink_bycat.dart';
import 'package:letsdrink/pages/listdrink_byglass.dart';
import 'package:shimmer/shimmer.dart';

class DetailWidget extends StatelessWidget {
  final String idDrink;

  DetailWidget(this.idDrink);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<DrinksData>(
        future: Api().getDetail(idDrink),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            var dt = snapshot.data.drinks[0];
            return ListView(
              children: <Widget>[
                _widgetCard(context, dt),
                Divider(),
                _widgetIngredients(context, dt),
                Divider(),
                _widgetInstructions(context, dt)
              ],
            );
          }
          return _loadData(context);
        },
      ),
    );
  }

  Widget _widgetCard(context, data) {
    return Row(
      children: <Widget>[
        _cardDetail(
          context,
          Icons.local_drink,
          data.strCategory,
          Theme.of(context).primaryColor,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: Container(
            width: MediaQuery.of(context).size.width * 70 / 100,
            height: 115,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Glass',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new CupertinoPageRoute(
                            builder: (context) =>
                                ListDrinkGlass(data.strGlass)));
                      },
                      child: Chip(
                        label: Text(
                          data.strGlass,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Alcoholic',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new CupertinoPageRoute(
                            builder: (context) =>
                                ListDrinkAlcohol(data.strAlcoholic)));
                      },
                      child: Chip(
                        label: Text(
                          data.strAlcoholic,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.deepOrange,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _widgetIngredients(context, data) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Ingredients',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                data.strIngredient1 == null || data.strIngredient1 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient1),
                data.strIngredient2 == null || data.strIngredient2 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient2),
                data.strIngredient3 == null || data.strIngredient3 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient3),
                data.strIngredient4 == null || data.strIngredient4 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient4),
                data.strIngredient5 == null || data.strIngredient5 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient5),
                data.strIngredient6 == null || data.strIngredient6 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient6),
                data.strIngredient7 == null || data.strIngredient7 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient7),
                data.strIngredient8 == null || data.strIngredient8 == ""
                    ? Container()
                    : _filterChip(context, data.strIngredient8),
                data.strIngredient9 != null || data.strIngredient9 != ""
                    ? Container()
                    : _filterChip(context, data.strIngredient9),
                data.strIngredient10 != null || data.strIngredient10 != ""
                    ? Container()
                    : _filterChip(context, data.strIngredient10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetInstructions(context, data) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Instructions',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              child: Text(
                data.strInstructions,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardDetail(context, icon, text, color) {
    return Card(
      elevation: 3,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(
              new CupertinoPageRoute(builder: (context) => ListDrinkCat(text)));
        },
        child: Container(
          height: 115,
          width: MediaQuery.of(context).size.width * 21 / 100,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                icon,
                size: 35,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Text(text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterChip(context, label) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          label.toString(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        shape: StadiumBorder(
            side: BorderSide(color: Theme.of(context).primaryColor)),
      ),
    );
  }

  Widget _loadData(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: ListView(
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Column(
              children: <Widget>[
                Container(
                  height: 115.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 200.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
