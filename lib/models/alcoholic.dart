class Aldata {
  List<Alcohol> alcohol;

  Aldata({this.alcohol});

  Aldata.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      alcohol = new List<Alcohol>();
      json['drinks'].forEach((d) {
        alcohol.add(new Alcohol.fromJson(d));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.alcohol != null) {
      data['drinks'] = this.alcohol.map((d) => d.toJson()).toList();
    }
    return data;
  }
}

class Alcohol {
  String strAlcoholic;

  Alcohol({
    this.strAlcoholic,
  });

  Alcohol.fromJson(Map<String, dynamic> json) {
    strAlcoholic = json['strAlcoholic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strAlcoholic'] = this.strAlcoholic;
    return data;
  }
}
