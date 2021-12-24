import 'dart:convert';

ModelDataLegal userModelFromJson(String str) =>
    ModelDataLegal.fromJson(json.decode(str));
String userModelToJson(ModelDataLegal data) => json.encode(data.toJson());

class ModelDataLegal {
  String pt; 
  String nama;
  String link;
  ModelDataLegal({this.pt, this.nama, this.link});

  factory ModelDataLegal.fromJson(Map<String, dynamic> json) => ModelDataLegal(
        pt: json['owner'],
        nama: json['name'],
        link: json['url']
      );

  Map<String, dynamic> toJson() => {
        'owner': pt,
        'name': nama,
        'url': link
      };
}
