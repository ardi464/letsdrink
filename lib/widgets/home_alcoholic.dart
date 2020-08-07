import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/alcoholic.dart';
import 'package:letsdrink/pages/listdrink_byal.dart';
import 'package:shimmer/shimmer.dart';

class HomeAlcoholic extends StatefulWidget {
  @override
  _HomeAlcoholicState createState() => _HomeAlcoholicState();
}

class _HomeAlcoholicState extends State<HomeAlcoholic> {
  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Aldata>(
      future: api.getListAlcohol(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Alcohol or Non Alcohol? See Below:',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                GridView.builder(
                  physics: new NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: snapshot == null ? 0 : 3,
                  itemBuilder: (BuildContext context, i) {
                    var dt = snapshot.data.alcohol[i];
                    String img;
                    if (i == 0) {
                      img =
                          'https://www.unlockfood.ca/EatRightOntario/media/Website-images-resized/Alcohol-v-2-resized.jpg';
                    } else if (i == 1) {
                      img =
                          'https://www.belmontbev.com/wp-content/uploads/2018/04/coctail-image.jpg';
                    } else {
                      img =
                          'https://media-cdn.tripadvisor.com/media/photo-s/11/dd/39/df/coctail.jpg';
                    }
                    return dt.strAlcoholic != null
                        ? Card(
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 4,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context,CupertinoPageRoute(
                                  builder: (context) => ListDrinkAlcohol(dt.strAlcoholic)
                                ));
                              },
                              splashColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                        Colors.black.withOpacity(0.6),
                                        BlendMode.dstATop,
                                      ),
                                      image: NetworkImage(img),
                                    ),
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      dt.strAlcoholic,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          )
                        : SizedBox();
                  },
                ),
              ],
            ),
          );
        }
        return _loadAlcoholic(context);
      },
    );
  }

  Widget _loadAlcoholic(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, bottom: 20, right: 10),
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
                                height: 120.0,
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
