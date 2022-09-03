import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=77bc34283290477e8d3684cd36641e7e'));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
