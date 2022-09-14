import 'package:flutter/material.dart';
import 'package:my_personal_website/Widgets/navigatorBar.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String index = 'Home';
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //Computer screen
        if (constraints.maxWidth > 1100) {
          return Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ NavigatorBar(index: index,)]));
          //phone screen
        } else {
          return Scaffold(
            body: Column(
              children: [],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 8, 35, 56),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white,),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,color: Colors.white),
                  label: 'About me',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book, color: Colors.white),
                  label: 'Projects',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail,color: Colors.white),
                  label: 'Contact',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
