import 'dart:convert';
import 'package:capstone_dicoding/model/model_illegal.dart';
import 'package:http/http.dart' as http;

class IllegalRepository {
  Future<List<ModelDataIllegal>> getIllegal() async {
    var response =
        await http.get(Uri.parse('https://ojk-invest-api.vercel.app/api/illegals'));
    var responseJson = json.decode(response.body);
    return (responseJson['data']['illegals'] as List)
        .map((e) => ModelDataIllegal.fromJson(e))
        .where((element) => element.type.isNotEmpty && element.pt.isNotEmpty)
        .toList();
  }
}
