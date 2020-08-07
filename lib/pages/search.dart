import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsdrink/api/api.dart';
import 'package:letsdrink/models/drink.dart';

import 'drink_detail.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Api api = new Api();
  bool _isLoading = false;
  bool drink = false;
  int val;

  final newData = new List<Drinks>();

  TextEditingController _searchController = TextEditingController();

  search() {
    newData.clear();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    String _searchtext = _searchController.text.toString();
    setState(() {
      _isLoading = true;
    });
    if (_searchtext != '') {
      api.getSearch(_searchtext).then((res) {
        setState(() {
          _isLoading = false;
          drink = true;
        });
        if (res != null) {
          res.forEach((data) {
            final dt = new Drinks(
                idDrink: data['idDrink'],
                strDrink: data['strDrink'],
                strDrinkThumb: data['strDrinkThumb']);
            newData.add(dt);
          });
          setState(() {
            val = 1;
          });
        } else {
          setState(() {
            val = 0;
          });
        }
      });
    } else {
      setState(() {
        val = 2;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                autofocus: true,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Type here...",
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                    },
                    focusColor: Colors.grey,
                    icon: Icon(Icons.close),
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4.3, bottom: 4.3, right: 10),
            child: SizedBox(
              width: 50,
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  search();
                },
                icon: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: _isLoading == false
                      ? Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.white,
                        )
                      : SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                ),
                padding: EdgeInsets.only(right: 10),
              ),
            ),
          )
        ],
      ),
      body: _isLoading
          ? _isLoad(context)
          : val == 1
              ? _searchResult(context)
              : val == 0 ? _notFound(context) : _noSearch(context),
    );
  }

  Widget _isLoad(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading Data',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchResult(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: newData == null ? 0 : newData.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, i) {
          var dt = newData[i];
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }

  Widget _notFound(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/imgs/notfound.png',
              width: 350,
            ),
            Text(
              'Not Found',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _noSearch(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/imgs/search.png',
              width: 350,
            ),
            Text(
              'Search here...',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
