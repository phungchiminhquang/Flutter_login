import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/models/accessToken.dart';

class AuthService {
  static var client = http.Client();

  static Future fetchAccessToken(String username, String password) async {
    var info = {
      'username': username,
      'password': password,
      'grant_type': 'password',
      'client_id': 'fbb8c58d5157474d8ce32a10b9b0117c'
    };
    var url = Uri.parse('http://login.vnopenlab.com/oauth2/token');

    var response = await client.post(
      url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: info,
    );

    if (response.statusCode == 200) {
      print("200 ok oke ok");
      var jsonString = response.body;
      return accessTokenFromJson(jsonString);
    } else {
      print("something error: ${response.statusCode}");
      return null;
    }
  }
}
