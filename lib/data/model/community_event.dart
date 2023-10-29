import 'dart:convert';
import 'dart:io';

CommunityEventResponse communityEventResponseFromJson(
        Map<String, dynamic> str) =>
    CommunityEventResponse.fromJson(str);

String communityEventResponseToJson(CommunityEventResponse data) =>
    json.encode(data.toJson());

String communityEventToJson(CommunityEvent data) => json.encode(data.toJson());

class CommunityEventResponse {
  List<CommunityEvent>? communityEvent;

  CommunityEventResponse({this.communityEvent});

  CommunityEventResponse.fromJson(Map<String, dynamic> json) {
    communityEvent = json["communityEvent"] == null
        ? null
        : (json["communityEvent"] as List)
            .map((e) => CommunityEvent.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (communityEvent != null) {
      data["communityEvent"] = communityEvent?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class CommunityEvent {
  String? title;
  String? desc;
  String? uploadBy;
  String? uploadDate;
  String? image;
  String? classDesc;
  File? imageUpload;
  String? imageName;

  CommunityEvent(
      {this.title,
      this.desc,
      this.uploadBy,
      this.uploadDate,
      this.image,
      this.imageUpload,
      this.imageName});

  CommunityEvent.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    desc = json["desc"];
    uploadBy = json["uploadBy"];
    uploadDate = json["uploadDate"];
    image = json["image"];
    classDesc = json["classDesc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["desc"] = desc;
    data["uploadBy"] = uploadBy;
    data["uploadDate"] = uploadDate;
    data["image"] = image;
    data["classDesc"] = classDesc;
    return data;
  }
}
