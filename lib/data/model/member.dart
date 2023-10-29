import 'dart:convert';

MemberResponse memberResponseFromJson(Map<String, dynamic> str) =>
    MemberResponse.fromJson(str);

String memberResponseToJson(MemberResponse data) => json.encode(data.toJson());

class MemberResponse {
  List<Member>? listMember;

  MemberResponse({this.listMember});

  MemberResponse.fromJson(Map<String, dynamic> json) {
    listMember = json["listMember"] == null
        ? null
        : (json["listMember"] as List).map((e) => Member.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listMember != null) {
      data["listMember"] = listMember?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Member {
  String? id;
  String? name;
  String? photo;
  String? position;

  Member({this.id, this.name, this.photo, this.position});

  Member.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    photo = json["photo"];
    position = json["position"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["photo"] = photo;
    data["position"] = position;
    return data;
  }
}
