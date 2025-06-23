class ProjectTab {
  String author = '';
  int courseId = 0;
  String cover = '';
  String desc = '';
  int id = 0;
  String name = '';
  int order = 0;
  int parentChapterId = 0;
  int type = 0;
  bool userControlSetTop = false;
  int visible = 0;

  ProjectTab.fromJson(Map<String, dynamic> json) {
    author = json['author'] as String;
    courseId = json['courseId'] as int;
    cover = json['cover'] as String;
    desc = json['desc'] as String;
    id = json['id'] as int;
    name = json['name'] as String;
    order = json['order'] as int;
    parentChapterId = json['parentChapterId'] as int;
    type = json['type'] as int;
    userControlSetTop = json['userControlSetTop'] as bool;
    visible = json['visible'] as int;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'courseId': courseId,
      'cover': cover,
      'desc': desc,
      'id': id,
      'name': name,
      'order': order,
      'parentChapterId': parentChapterId,
      'type': type,
      'userControlSetTop': userControlSetTop,
      'visible': visible,
    };
  }
}
