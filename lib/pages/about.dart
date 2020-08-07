import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'This App is Developed By',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 200,
              width: 230,
              child: Image.asset('assets/imgs/letsapp.png'),
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  CardList(
                    title: 'Developer',
                    sub: 'LetsApp Software Developer',
                    icon: Icons.laptop_mac,
                  ),
                  CardList(
                    title: 'Version',
                    sub: '0.1 Beta',
                    icon: Icons.phone_android,
                  ),
                  CardList(
                    title: 'Data Source',
                    sub: 'https://www.thecocktaildb.com/',
                    icon: Icons.web,
                  ),
                  CardList(
                    title: 'Donate me to Paypal',
                    sub: 'acluentz@gmail.com',
                    icon: Icons.payment,
                  ),
                  CardList(
                    title: 'More Information ',
                    sub: 'https://letsapp.sultancoding.com/',
                    icon: Icons.info_outline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final String title;
  final String sub;
  final IconData icon;

  CardList({this.title, this.sub, this.icon});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(sub),
    );
  }
}
