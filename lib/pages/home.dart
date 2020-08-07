import 'package:flutter/material.dart';
import 'package:letsdrink/widgets/home_alcoholic.dart';
import 'package:letsdrink/widgets/home_category.dart';
import 'package:letsdrink/widgets/home_glass.dart';
import 'package:letsdrink/widgets/home_header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomeHeader(),
          HomeCategory(),
          HomeAlcoholic(),
          HomeGlass(),
        ],
      ),
    );
  }
}
