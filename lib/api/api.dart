import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' show Client;
import 'package:letsdrink/models/alcoholic.dart';
import 'package:letsdrink/models/category.dart';
import 'package:letsdrink/models/glass.dart';
import 'dart:convert';
import '../models/drink.dart';

class Api {
  Client http = Client();

  static final String _url = 'https://www.thecocktaildb.com/api/json/v1/1/';

  Future<DrinksData> getList() async {
    final res = await http.get(_url + 'search.php?s=');
    if (res.statusCode == 200) {
      return DrinksData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<DrinksData> getDrinkCat(String catDrink) async {
    final res = await http.get(_url + 'filter.php?c=$catDrink');
    if (res.statusCode == 200) {
      return DrinksData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<DrinksData> getDrinkAlcohol(String alDrink) async {
    final res = await http.get(_url + 'filter.php?a=$alDrink');
    if (res.statusCode == 200) {
      return DrinksData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<DrinksData> getDrinkGlass(String glassDrink) async {
    final res = await http.get(_url + 'filter.php?g=$glassDrink');
    if (res.statusCode == 200) {
      return DrinksData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<DrinksData> getDetail(String strId) async {
    final res = await http.get(_url + 'lookup.php?i=$strId');
    if (res.statusCode == 200) {
      return DrinksData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<dynamic> getSearch(String strDrink) async {
    final res = await http.get(_url + 'search.php?s=$strDrink');
    if (res.statusCode == 200) {
      var dt = json.decode(res.body);
      var drink = dt['drinks'];
      return drink;
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<CatData> getListCat() async {
    final res = await http.get(_url + 'list.php?c=list');
    if (res.statusCode == 200) {
      return CatData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<Aldata> getListAlcohol() async {
    final res = await http.get(_url + 'list.php?a=list');
    if (res.statusCode == 200) {
      return Aldata.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<GlassData> getListGlass() async {
    final res = await http.get(_url + 'list.php?g=list');
    if (res.statusCode == 200) {
      return GlassData.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Load');
    }
  }
}
