import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1100) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                    width: MediaQuery.of(context).size.width/3,
                    child: Image.asset('lib/IMG/FlutterIcon.png'),
                  ),
                  Text(
                    'Hello I\'m Maxime ! ',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Welcome in my website',
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'I\'m a Flutter developper. You will found all my personal projects here. ',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                 SizedBox(height: 100,),
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
            ),
          );
        } else {
          return Row(
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
                    Text(
                      'Hello I\'m Maxime ! ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome in my website',
                      style: Theme.of(context).textTheme.headline2,
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
          );
        }
      },
    );
  }
}
