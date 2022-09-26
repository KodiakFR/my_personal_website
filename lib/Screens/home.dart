import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

ScrollController _scrollController = ScrollController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1100) {
          return Scaffold(
            body: SingleChildScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Image.asset('lib/IMG/FlutterIcon.png'),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'Hello I\'m Maxime ! ',
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Text('Welcome in my website',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FittedBox(
                        child: Text(
                          'I\'m a Flutter developper. You will found all my personal projects here. ',
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('Found me on ',
                              style: Theme.of(context).textTheme.headline5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse('https://github.com/KodiakFR'),
                                builder: (context, followLink) => IconButton(
                                    onPressed: followLink,
                                    icon:
                                        const Icon(FontAwesomeIcons.github)),
                              ),
                              Link(
                                target: LinkTarget.blank,
                                uri: Uri.parse(
                                    'https://www.linkedin.com/in/maxime-braud/'),
                                builder: (context, followLink) => IconButton(
                                    onPressed: followLink,
                                    icon: const Icon(
                                        FontAwesomeIcons.linkedinIn)),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset('lib/IMG/FlutterIcon.png', scale: 1.2),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text('Hello I\'m Maxime ! ',
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FittedBox(
                        child: Text('Welcome in my website',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'I\'m a Flutter developper. You will found all my personal projects here. ',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('Found me on : ',
                              style: Theme.of(context).textTheme.headline5),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse('https://github.com/KodiakFR'),
                            builder: (context, followLink) => IconButton(
                                onPressed: followLink,
                                icon: const Icon(FontAwesomeIcons.github)),
                          ),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                                'https://www.linkedin.com/in/maxime-braud/'),
                            builder: (context, followLink) => IconButton(
                                onPressed: followLink,
                                icon: const Icon(FontAwesomeIcons.linkedinIn)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
