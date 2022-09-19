import '../Entity/repo_entity.dart';
import 'package:dio/dio.dart';

class RepoServices {
  Future<All> fetchRepos() async {
    final reponse = await Dio().get('https://api.github.com/users/KodiakFR/repos');
    if (reponse.statusCode == 200) {
      return All.fromJson(reponse.data);
    } else {
      throw Exception('Failed to fetch repos!');
    }
  }
}
