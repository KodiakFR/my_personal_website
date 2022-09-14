import 'package:flutter/material.dart';
import 'package:my_personal_website/Screens/Index.dart';

import '../Widgets/NavigatorBar.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String index = 'About me';
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
              currentIndex: 1,
              onTap: (value) {
                switch (value) {
                  case 0: {
                    Navigator.pushReplacementNamed(context, '/home');
                  } 
                  break;
                  case 1: {
                    Navigator.pushReplacementNamed(context, '/aboutMe');
                  }                   
                    break;
                  default:{
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                }
              },
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