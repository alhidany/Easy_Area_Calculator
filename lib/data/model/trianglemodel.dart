class AreaTriangle {
  int? id;
  double? a;
  double? b;
  double? c;
  double? total;

  AreaTriangle({this.id, this.a, this.b, this.c, this.total});

  AreaTriangle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['total'] = this.total;
    return data;
  }
}
