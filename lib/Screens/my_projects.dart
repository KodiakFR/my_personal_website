import 'package:flutter/material.dart';
import 'package:my_personal_website/Entity/repo_entity.dart';
import 'package:my_personal_website/Services/repo_services.dart';

import '../Entity/repo_entity.dart';

RepoServices _repoServices = RepoServices();

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  Future<All>? futureRepo;
  @override
  void initState() {
    super.initState();
    _repoServices.fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.8),
        child: Container(
          child: FutureBuilder<All>(
            future: futureRepo,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error!'));
              } else if (snapshot.hasData) {
                List<RepoEntity> repos = [];
                for (int i = 0; i < snapshot.data!.repos.length; i++) {
                  repos.add(
                    RepoEntity(
                      name: snapshot.data!.repos[i].name,
                      htmlUrl: snapshot.data!.repos[i].htmlUrl,
                      stargazersCount: snapshot.data!.repos[i].stargazersCount,
                      description: snapshot.data!.repos[i].description,
                    ),
                  );
                }
                return CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverGrid.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: repos
                            .map(
                              (r) => Card(
                                child: Column(
                                  
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
              ;
            },
          ),
        ),
      ),
    );
  }
}
