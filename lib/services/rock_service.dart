import 'dart:convert';

import 'package:rock_app/models/rock_model.dart';
import 'package:http/http.dart' as http;

const url = 'https://us-central1-rockapp-26f79.cloudfunctions.net';

class RockService {

  Future<List<RockModel>> getListData() async {
    var listUrl = Uri.parse('$url/getAll');
    print("getListData listUrl : $listUrl");
    final response = await http.post(listUrl);
    print("getListData : ${response.statusCode}");
    if (response.statusCode == 200) {
      print("getListData jsonMap : ${response.body}");
      var jsonMap = jsonDecode(response.body) as List;
      print("getListData jsonMap : ${jsonMap.length}");
      List<RockModel> resData = jsonMap.map((json) => RockModel.fromJson(json)).toList();
      print("getListData resData : ${resData.length}");
      return resData;
    }else{
      return [];
    }
  }

}
