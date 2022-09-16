class RepoEntity {
  String name;
  String htmlUrl;
  int stargazersCount;
  String description;

  RepoEntity({
    required this.name,
    required this.htmlUrl,
    required this.stargazersCount,
    required this.description,
  });

  factory RepoEntity.fromJson(Map<String, dynamic> json) {
    return RepoEntity(
      name: json['name'],
      htmlUrl: json['html_url'],
      stargazersCount: json['stargazers_count'],
      description: json['description'],
    );
  }
}

class All{
  List<RepoEntity> repos;

  All({required this.repos});

  factory All.fromJson(List<dynamic> json){
    List<RepoEntity> repos;
    repos = json.map((r) => RepoEntity.fromJson(r)).toList();
    return All(repos: repos);
  }
}
