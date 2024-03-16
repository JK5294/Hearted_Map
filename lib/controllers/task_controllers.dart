import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TaskController extends GetxController {
  Future<String> sendLGDataToBackend(String phone, String pass) async {
    var headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'Apifox/1.0.0 (https://apifox.com)'
    };

    var body = jsonEncode({
      'phoneNumber': phone,
      'password': pass,
    });

    var response = await http.post(
      Uri.parse('https://192.168.1.109:8080//heartedmap/register'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print(response.reasonPhrase);
      // 根据具体需求返回相应的错误信息或进行错误处理
      return 'Error: ${response.reasonPhrase}';
    }
  }
}
