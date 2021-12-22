import 'dart:convert';

ModelDataLegal userModelFromJson(String str) =>
    ModelDataLegal.fromJson(json.decode(str));
String userModelToJson(ModelDataLegal data) => json.encode(data.toJson());

class ModelDataLegal {
  String pt; 
  String nama;
  ModelDataLegal({this.pt, this.nama});

  factory ModelDataLegal.fromJson(Map<String, dynamic> json) => ModelDataLegal(
        pt: json['owner'],
        nama: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'owner': pt,
        'name': nama,
      };
}
