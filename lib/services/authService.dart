import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/models/accessTokenModel.dart';
import 'package:login/data/globalConfig.dart' as globalConfig;

class AuthService {
  static var client = http.Client();

  static Future fetchAccessToken(String username, String password) async {
    var info = {
      'username': username,
      'password': password,
      'grant_type': 'password',
      'client_id': globalConfig.clientId
    };
    var url = Uri.parse(globalConfig.authUserCreUrl);

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
