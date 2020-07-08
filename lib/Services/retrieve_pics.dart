import 'dart:convert';
import 'package:bipolarfactory/Models/info_model.dart';
import 'package:http/http.dart' as http;

class PicsCollection {
  String errorMessage;
  static Future getData(int page) async {
    String url =
        "https://api.unsplash.com/collections/1580860/photos?id=139386&orientation=portrait&page=$page";
    Map<String, String> headers = {
      "Authorization": "Client-ID K45qARzHf2TLPkl7qMoyir65Ta_nPgBKVGyxQ--TeB8"
    };
    http.Response response = await http.get(url, headers: headers);
    String content = response.body;
    print(response.statusCode);
    if (response.statusCode == 200) {
      List collection = json.decode(content);
      List<InfoModel> _data =
          collection.map((e) => InfoModel.fromJson(e)).toList();
      return _data;
    }
    return "Error";
  }
}
