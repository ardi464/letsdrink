import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/glass.dart';
import 'package:shimmer/shimmer.dart';

import 'listdrink_byglass.dart';

class GlassAll extends StatefulWidget {
  @override
  _GlassAllState createState() => _GlassAllState();
}

class _GlassAllState extends State<GlassAll> {
  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose By Glass Style',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: bodyGlassAll(context),
    );
  }

  Widget bodyGlassAll(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<GlassData>(
        future: api.getListGlass(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot == null ? 0 : 30,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ListDrinkGlass(snapshot.data.glass[i].strGlass),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: ListTile(
                      leading: Icon(
                        Icons.local_drink,
                        color: Theme.of(context).primaryColor,
                        size: 40,
                      ),
                      title: Text(
                        snapshot.data.glass[i].strGlass,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Click to See',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor,),
                    ),
                  ),
                );
              },
            );
          }
          return _loadGlass(context);
        },
      ),
    );
  }

  Widget _loadGlass(context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ListView(
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Column(
              children: [0, 1, 2, 3, 4, 5, 6, 7, 8]
                  .map(
                    (_) => Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 80.0,
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
