class SystemEntity {
  List<Children> children = [];
  int courseId = 0;
  int id = 0;
  String name = '';
  int order = 0;
  int parentChapterId = 0;
  int visible = 0;

  SystemEntity({
    required this.children,
    required this.courseId,
    required this.id,
    required this.name,
    required this.order,
    required this.parentChapterId,
    required this.visible,
  });

  SystemEntity.fromJson(Map<String, dynamic> json) {
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children.add(Children.fromJson(v));
      });
    }
    courseId = json['courseId'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['children'] = children.map((v) => v.toJson()).toList();
    data['courseId'] = courseId;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['parentChapterId'] = parentChapterId;
    data['visible'] = visible;
    return data;
  }
}

class Children {
  int courseId = 0;
  int id = 0;
  String name = '';
  int order = 0;
  int parentChapterId = 0;
  int visible = 0;

  Children({
    required this.courseId,
    required this.id,
    required this.name,
    required this.order,
    required this.parentChapterId,
    required this.visible,
  });

  Children.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseId'] = courseId;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['parentChapterId'] = parentChapterId;
    data['visible'] = visible;
    return data;
  }
}
