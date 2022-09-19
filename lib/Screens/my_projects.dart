import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_personal_website/Entity/repo_entity.dart';
import 'package:my_personal_website/Services/repo_services.dart';
import 'package:url_launcher/link.dart';

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
            future: _repoServices.fetchRepos(),
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
                        crossAxisCount: 4,
                        children: repos
                            .map(
                              (r) => Card(
                                elevation: 10,
                                child: Column(
                                  children: [
                                    Text(
                                      r.name,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    Text(r.description),
                                    Link(
                                      target: LinkTarget.blank,
                                      uri: Uri.parse(r.htmlUrl),
                                      builder: (context, followLink) =>
                                          IconButton(
                                              onPressed: followLink,
                                              icon: const Icon(
                                                  FontAwesomeIcons.github),color: Colors.black,),
                                    ),
                                  ],
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
            },
          ),
        ),
      ),
    );
  }
}
