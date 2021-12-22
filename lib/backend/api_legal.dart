import 'dart:convert';
import 'package:capstone_dicoding/model/model_legal.dart';
import 'package:http/http.dart' as http;

class LegalRepository {
  Future<List<ModelDataLegal>> getLegal() async {
    var response =
        await http.get(Uri.parse('https://ojk-invest-api.vercel.app/api/apps'));
    var responseJson = json.decode(response.body);
    return (responseJson['data']['apps'] as List)
        .map((e) => ModelDataLegal.fromJson(e))
        .where((element) => element.nama.isNotEmpty && element.pt.isNotEmpty)
        .toList();
  }
}
