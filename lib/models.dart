class Model {
  List<Root> root;

  Model({this.root});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['root'] != null) {
      root = List<Root>();
      json['root'].forEach((v) {
        root.add(Root.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.root != null) {
      data['root'] = this.root.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Root {
  String language;
  List<Details> details = [];

  Root({this.language, this.details});

  Root.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    if (json['details'] != null) {
      details = List<Details>();
      json['details'].forEach((v) {
        details.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['language'] = this.language;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String keyword;
  String description;

  Details({this.keyword, this.description});

  Details.fromJson(Map<String, dynamic> json) {
    keyword = json['keyword'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['keyword'] = this.keyword;
    data['description'] = this.description;
    return data;
  }
}
