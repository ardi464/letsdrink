import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      child: Container(
        height: 120,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/imgs/logo.png',
                height: 80,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 5, right: 10),
                child: Text(
                  'Recipe Application while you need to make The Best Drink',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
