import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return Scaffold(
        body: Center(
            child: ContactUs(
          companyName: 'Contact me on',
          textColor: Colors.white,
          cardColor: const Color.fromARGB(255, 40, 60, 77),
          companyColor: Colors.white,
          taglineColor: Colors.red,
          email: 'maxime.braud86@gmail.com',
          emailText: 'Email',
          linkedinURL: 'https://www.linkedin.com/in/maxime-braud/',
          githubUserName: 'KodiakFR',
        )),
      );
      
    }else{
       return Scaffold(
      body: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
            child: ContactUs(
        companyName: 'Contact me on',
        textColor: Colors.white,
        cardColor: const Color.fromARGB(255, 40, 60, 77),
        companyColor: Colors.white,
        taglineColor: Colors.red,
        email: 'maxime.braud86@gmail.com',
        emailText: 'Email',
        linkedinURL: 'https://www.linkedin.com/in/maxime-braud/',
        githubUserName: 'KodiakFR',
      ),
          )),
    );
    }
  }
}
