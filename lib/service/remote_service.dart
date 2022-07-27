import 'package:news_api/model/model.dart';
import 'package:http/http.dart' as http;
class RemoteService {
  Future<List<Post>?> getArticles() async {
    var client = http.Client();
    
    var uri = Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=738d45ec39784d0d816057372b2ccad0');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      print(response);
      var json = response.body;
      return postFromJson(json);
    }
  }
}