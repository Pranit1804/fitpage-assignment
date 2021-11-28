import 'package:http/http.dart';

abstract class BaseHomepageService {
  Future<String> getHomepageData();
}

class HomeapageService implements BaseHomepageService {
  @override
  Future<String> getHomepageData() async {
    String url = "https://mobile-app-challenge.herokuapp.com/data";

    final Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response);
    }
  }
}
