import 'package:flutter/material.dart';

 ScrollController _scrollController = ScrollController();

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 1100) {
          return Scaffold(
            body: SingleChildScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                  child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: CircleAvatar(
                        backgroundImage: const AssetImage('lib/IMG/ProfilImage.png'),
                        radius: MediaQuery.of(context).size.width / 6,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          right: 50, left: 50, top: 50, bottom: 20),
                      child: Text(
                        '"Hello, my name is Maxime Braud. I live in Toulouse, France. I worked for 10 years in the aeronautics sector. I did a professional reconversion to become a developer. I love my new job! This feeling is really important for me. I have been using Flutter since October 2021. I learned this technology myself for a personal project and I really enjoyed it. Now I want to work in this technology in a company to continue to train and learn. You will find on this site all my personal projects. You can write me on LinkedIn or through my Contact page."',
                        style:
                            TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                )
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: CircleAvatar(
                    backgroundImage: const AssetImage('lib/IMG/ProfilImage.png'),
                    radius: MediaQuery.of(context).size.width / 8,
                  ),
                ),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 200),
                    child: Text(
                      '"Hello, my name is Maxime Braud. I live in Toulouse, France. I worked for 10 years in the aeronautics sector. I did a professional reconversion to become a developer. I love my new job! This feeling is really important for me. I have been using Flutter since October 2021. I learned this technology myself for a personal project and I really enjoyed it. Now I want to work in this technology in a company to continue to train and learn. You will find on this site all my personal projects. You can write me on LinkedIn or through my Contact page."',
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                )
              ],
            )),
          );
        }
      },
    );
  }
}
