class GlassData {
  List<Glass> glass;

  GlassData({this.glass});

  GlassData.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      glass = new List<Glass>();
      json['drinks'].forEach((d) {
        glass.add(new Glass.fromJson(d));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.glass != null) {
      data['drinks'] = this.glass.map((d) => d.toJson()).toList();
    }
    return data;
  }
}

class Glass {
  String strGlass;

  Glass({
    this.strGlass,
  });

  Glass.fromJson(Map<String, dynamic> json) {
    strGlass = json['strGlass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strGlass'] = this.strGlass;
    return data;
  }
}
