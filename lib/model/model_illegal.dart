import 'dart:convert';

ModelDataIllegal userModelFromJson(String str) =>
    ModelDataIllegal.fromJson(json.decode(str));
String userModelToJson(ModelDataIllegal data) => json.encode(data.toJson());

class ModelDataIllegal {
  String pt;
  String type;
  ModelDataIllegal({this.pt, this.type});

  factory ModelDataIllegal.fromJson(Map<String, dynamic> json) =>
      ModelDataIllegal(
        pt: json['name'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'name': pt,
        'type': type,
      };
}
