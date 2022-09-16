import 'dart:convert';
import '../Entity/repo_entity.dart';
import 'package:http/http.dart' as http;

class RepoServices {
  Future<All> fetchRepos() async {
    final reponse = await http
        .get(Uri.parse('https://api.github.com/users/KodiakFR/repos'));
    if (reponse.statusCode == 200) {
      print(reponse.body);
      return All.fromJson(json.decode(reponse.body));
    } else {
      throw Exception('Failed to fetch repos!');
    }
  }
}
