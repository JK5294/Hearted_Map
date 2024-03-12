import 'package:http/http.dart' as http;

class DBController {
  void fetchData() async {
    var url = Uri.parse('https://192.168.1.109:8080//heartedmap/register');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // 请求成功，处理响应数据
        var data = response.body;
        print(data);
      } else {
        // 请求失败，处理错误信息
        print('请求失败: ${response.statusCode}');
      }
    } catch (e) {
      // 发生异常，处理错误信息
      print('发生异常: $e');
    }
  }
}
