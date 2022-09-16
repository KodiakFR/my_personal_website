import 'package:flutter/material.dart';
import 'package:my_personal_website/Screens/about_me.dart';
import 'package:my_personal_website/Screens/contact.dart';
import 'package:my_personal_website/Screens/my_projects.dart';
import 'package:my_personal_website/Widgets/custom_text_navigator.dart';

import '../Screens/home.dart';

class CustomPageController extends StatefulWidget {
  const CustomPageController({Key? key}) : super(key: key);

  @override
  State<CustomPageController> createState() => _CustomPageControllerState();
}

int bottomSelectedIndex = 0;

class _CustomPageControllerState extends State<CustomPageController> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: 1, keepPage: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        // phone screen
        if (constraints.maxWidth < 1100) {
          return Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomSelectedIndex = index;
                });
              },
              children: const <Widget>[
                HomePage(),
                AboutMe(),
                Projects(),
                Contact()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  bottomSelectedIndex = value;
                  pageController.animateToPage(value,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                });
              },
              currentIndex: bottomSelectedIndex,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 8, 35, 56),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white),
                  label: 'About me',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book, color: Colors.white),
                  label: 'Projects',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail, color: Colors.white),
                  label: 'Contact',
                ),
              ],
            ),
          );
          //computer screen
        } else {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 65, 115, 156),
                elevation: 0,
                actions: [
                  TextButton(
                    onPressed: () {
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: CustomTextNavigator(bottomControllerIndex: bottomSelectedIndex,index: 0,libelle: 'Home',),
                  ),
                  TextButton(
                      onPressed: () {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: CustomTextNavigator(bottomControllerIndex: bottomSelectedIndex,index: 1,libelle: 'About Me')),
                  TextButton(
                      onPressed: () {
                        pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: CustomTextNavigator(bottomControllerIndex: bottomSelectedIndex,index: 2,libelle: 'My Projects',)),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: TextButton(
                        onPressed: () {
                          pageController.animateToPage(3,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: CustomTextNavigator(bottomControllerIndex: bottomSelectedIndex,index: 3,libelle: 'Contacts',),),
                  ),
                ],
              ),
              body: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    bottomSelectedIndex = index;
                  });
                },
                children: const <Widget>[
                  HomePage(),
                  AboutMe(),
                  Projects(),
                  Contact()
                ],
              ));
        }
      },
    );
  }
}
