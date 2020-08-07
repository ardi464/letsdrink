class CatData {
  List<Cat> cats;

  CatData({this.cats});

  CatData.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      cats = new List<Cat>();
      json['drinks'].forEach((d) {
        cats.add(new Cat.fromJson(d));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cats != null) {
      data['drinks'] = this.cats.map((d) => d.toJson()).toList();
    }
    return data;
  }
}

class Cat {
  String strCategory;

  Cat({
    this.strCategory,
  });

  Cat.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strCategory'] = this.strCategory;
    return data;
  }
}
