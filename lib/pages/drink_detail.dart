import 'package:flutter/material.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/drink.dart';
import 'package:letsdrink/widgets/detail_widget.dart';

class DrinkDetail extends StatefulWidget {
  final dataId;
  final dataStr;

  DrinkDetail(this.dataId, this.dataStr);

  @override
  _DrinkDetailState createState() => _DrinkDetailState();
}

class _DrinkDetailState extends State<DrinkDetail> {
  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyDetail(context),
    );
  }

  Widget _bodyDetail(context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerScrollBox) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 35 / 100,
            floating: false,
            pinned: true,
            title: Text(
              widget.dataStr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: _headerImage(context, widget.dataId)),
          ),
        ];
      },
      body: Container(
        child: DetailWidget(widget.dataId),
      ),
    );
  }

  Widget _headerImage(context, id) {
    return FutureBuilder<DrinksData>(
      future: api.getDetail(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          return FadeInImage(
            image: NetworkImage(snapshot.data.drinks[0].strDrinkThumb),
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/imgs/loading.gif'),
            height: double.infinity,
          );
        }
        return Image(
          image: AssetImage('assets/imgs/loading.gif'),
          fit: BoxFit.cover,
          height: double.infinity,
        );
      },
    );
  }
}
