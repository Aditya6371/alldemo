import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class Api {
  const Api._();

  static Future<dynamic> callGetApi(String url) async {
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("Expection Caught");
    }
  }

  static Future<dynamic> callPostApi(String url) async {
    try {
      final response = await post(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("Expection Caught");
    }
  }
}
