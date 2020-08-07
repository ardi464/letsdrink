import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdrink/pages/drink_detail.dart';

class DrinkGrid extends StatelessWidget {
  final snapshot;

  DrinkGrid(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: snapshot == null ? 0 : snapshot.data.drinks.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, i) {
        var dt = snapshot.data.drinks[i];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              new CupertinoPageRoute(
                builder: (context) => DrinkDetail(dt.idDrink, dt.strDrink),
              ),
            );
          },
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    image: NetworkImage(dt.strDrinkThumb),
                    placeholder: AssetImage('assets/imgs/loading.gif'),
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      dt.strDrink,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
