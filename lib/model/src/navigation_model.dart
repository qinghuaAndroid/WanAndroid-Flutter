class Navigation {
  List articles = [];

  int cid = 0;

  String name = '';

  Navigation({required this.articles, required this.cid, required this.name});

  Navigation.fromJson(Map<dynamic, dynamic> json) {
    cid = json["cid"];
    name = json["name"];
    articles = json['articles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["articles"] = articles;
    data["cid"] = cid;
    data["name"] = name;
    return data;
  }
}
