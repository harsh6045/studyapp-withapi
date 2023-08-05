import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LessonsController {
  Future getLessons() async {
    var url =
        Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/lessons");
    Response response = await http.get(url).timeout(Duration(seconds: 10));
    final temp = json.decode(response.body);
    print(response.body);
    return temp;
  }
}
