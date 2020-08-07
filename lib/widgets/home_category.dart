import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/category.dart';
import 'package:letsdrink/pages/listdrink_bycat.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategory extends StatefulWidget {
  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CatData>(
      future: api.getListCat(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Choose By Category:',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 70.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot == null ? 0 : snapshot.data.cats.length,
                    itemBuilder: (context, i) {
                      var dt = snapshot.data.cats[i];
                      return Container(
                        width: 150,
                        child: dt.strCategory == ''
                            ? Container()
                            : Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 4,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      new CupertinoPageRoute(
                                        builder: (context) =>
                                            ListDrinkCat(dt.strCategory),
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        dt.strCategory,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Theme.of(context).primaryColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return _loadCategory(context);
      },
    );
  }

  Widget _loadCategory(context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 18.0, bottom: 20, right: 10, top: 10),
      child: Column(
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 20.0,
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [0, 1, 2]
                      .map((_) => Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 50.0,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
