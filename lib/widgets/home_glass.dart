import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/glass.dart';
import 'package:letsdrink/pages/glass_all.dart';
import 'package:letsdrink/pages/listdrink_byglass.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class HomeGlass extends StatefulWidget {
  @override
  _HomeGlassState createState() => _HomeGlassState();
}

class _HomeGlassState extends State<HomeGlass> {
  Api api = new Api();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GlassData>(
      future: api.getListGlass(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'You Can Choose By Glass here:',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.scale,
                              alignment: Alignment.centerRight,
                              child: GlassAll(),
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: snapshot == null ? 0 : 6,
                  itemBuilder: (context, i) {
                    var dt = snapshot.data.glass[i];
                    String img;
                    if (i == 0) {
                      img =
                          'https://cheers.org.nz/mysite/images/pouring/image-sequence/spirits/DSC_0290.jpeg';
                    } else if (i == 1) {
                      img =
                          'http://media.istockphoto.com/photos/glasses-of-martini-coctail-picture-id641651186?k=6&m=641651186&s=612x612&w=0&h=v6GSZD7OXSxuhYYwtGxwuuP_lIYIGDUdutLZy-qpp4E=';
                    } else if (i == 2) {
                      img =
                          'https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/passionfruit-pornstar-martini.jpg';
                    } else if (i == 3) {
                      img =
                          'https://nepascene.com/wp-content/uploads/2016/06/Greater-Scranton-Jaycees-cards-cocktails-martini-Thirst-Ts-Olyphant.jpg';
                    } else if (i == 4) {
                      img =
                          'https://media-cdn.tripadvisor.com/media/photo-s/12/70/9a/0b/cocktails.jpg';
                    } else {
                      img =
                          'https://ii1.pepperfry.com/media/catalog/product/g/l/494x544/glass-310-ml-cocktail-glass--set-of-6-by-ocean-glass-310-ml-cocktail-glass--set-of-6-by-ocean-i22hqf.jpg';
                    }
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 2,
                      child: InkWell(
                        splashColor: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context) => ListDrinkGlass(dt.strGlass)
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.dstATop,
                              ),
                              fit: BoxFit.cover,
                              image: NetworkImage(img),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                dt.strGlass,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
        return _loadGlass(context);
      },
    );
  }

  Widget _loadGlass(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 10),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 50,
                        height: 20.0,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                      ),
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
                                height: 130.0,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ))
                      .toList(),
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
