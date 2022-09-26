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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.8),
          child: FutureBuilder<All>(
            future: _repoServices.fetchRepos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Error!',
                  style: Theme.of(context).textTheme.headline3,
                ));
              } else if (snapshot.hasData) {
                List<RepoEntity> repos = [];
                for (int i = 0; i < snapshot.data!.repos.length; i++) {
                  repos.add(
                    RepoEntity(
                      name: snapshot.data!.repos[i].name,
                      htmlUrl: snapshot.data!.repos[i].htmlUrl,
                      stargazersCount: snapshot.data!.repos[i].stargazersCount,
                      description: snapshot.data!.repos[i].description,
                      language: snapshot.data!.repos[i].language,
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
                        crossAxisCount: 5,
                        children: repos
                            .map(
                              (r) => Card(
                                color: const Color.fromRGBO(208, 214, 223, 0.8),
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 20,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Text(
                                        r.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    if (r.description != null)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                          r.description!,
                                          textAlign: TextAlign.justify,
                                        ),
                                      )
                                    else
                                      const Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Text('')),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Link(
                                            target: LinkTarget.blank,
                                            uri: Uri.parse(r.htmlUrl),
                                            builder: (context, followLink) =>
                                                IconButton(
                                              onPressed: followLink,
                                              icon: const Icon(
                                                FontAwesomeIcons.github,
                                                size: 45,
                                              ),
                                              color: Colors.black,
                                            ),
                                          ),
                                          if (r.language != null &&
                                              r.language != 'C++' && r.language != 'Dart')
                                            Text('Language: ' + r.language!)
                                          else if (r.language == 'C++' || r.language == 'Dart')
                                            const Text('Language : Flutter')
                                          else
                                            const Text('')
                                        ],
                                      ),
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
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
