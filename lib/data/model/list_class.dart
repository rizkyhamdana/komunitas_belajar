import 'dart:convert';

ListClassResponse listClassResponseFromJson(Map<String, dynamic> str) =>
    ListClassResponse.fromJson(str);

String listClassResponseToJson(ListClassResponse data) =>
    json.encode(data.toJson());

class ListClassResponse {
  List<ListClass>? listClass;

  ListClassResponse({this.listClass});

  ListClassResponse.fromJson(Map<String, dynamic> json) {
    listClass = json["listClass"] == null
        ? null
        : (json["listClass"] as List)
            .map((e) => ListClass.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listClass != null) {
      data["listClass"] = listClass?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ListClass {
  int? id;
  String? classDesc;

  ListClass({this.id, this.classDesc});

  ListClass.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    classDesc = json["classDesc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["classDesc"] = classDesc;
    return data;
  }
}
