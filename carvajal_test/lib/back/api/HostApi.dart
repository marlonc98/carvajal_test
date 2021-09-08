import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HostApi {
  static const hostUrl = 'http://127.0.0.1:8000/api'; //para ios
  //static const hostUrl = 'http://10.0.2.2:8000/api'; //para android

  static Future<Map<String, String>> headers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return {
      'Authorization': 'Bearer ${sharedPreferences.getString('token')}',
      "Content-Type": "application/json; charset=utf-8"
    };
  }

  static Future<String?> post(relativeUrl, values) async {
    Map<String, String> headers = await HostApi.headers();
    Uri url = Uri.parse(hostUrl + relativeUrl);
    http.Response response =
        await http.post(url, headers: headers, body: json.encode(values));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return response.body;
    }
    return null;
  }

  static Future<String?> put(relativeUrl, values) async {
    Map<String, String> headers = await HostApi.headers();
    Uri url = Uri.parse(hostUrl + relativeUrl);
    http.Response response =
        await http.put(url, headers: headers, body: json.encode(values));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return response.body;
    }
    return null;
  }

  static Future<String?> get(relativeUrl) async {
    Map<String, String> headers = await HostApi.headers();
    Uri url = Uri.parse(hostUrl + relativeUrl);
    http.Response response = await http.get(url, headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return response.body;
    }
    return null;
  }
}
