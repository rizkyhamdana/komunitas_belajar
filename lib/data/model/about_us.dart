import 'dart:convert';

AboutUs aboutUsFromJson(Map<String, dynamic> str) => AboutUs.fromJson(str);

String aboutUsToJson(AboutUs data) => json.encode(data.toJson());

class AboutUs {
  String? address;
  String? elder;
  String? leader;
  String? secretary;
  String? treasurer;
  String? pic;

  AboutUs(
      {this.address,
      this.elder,
      this.leader,
      this.secretary,
      this.treasurer,
      this.pic});

  AboutUs.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    elder = json["elder"];
    leader = json["leader"];
    secretary = json["secretary"];
    treasurer = json["treasurer"];
    pic = json["pic"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["address"] = address;
    data["elder"] = elder;
    data["leader"] = leader;
    data["secretary"] = secretary;
    data["treasurer"] = treasurer;
    data["pic"] = pic;
    return data;
  }
}
