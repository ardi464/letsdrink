import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DrinkShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: ListView(
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Column(
              children: [0,1,2,3].map((_) =>
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [0, 1]
                        .map((_) => Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 200.0,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ).toList()
            ),
          ),
        ],
      ),
    );
  }
}
