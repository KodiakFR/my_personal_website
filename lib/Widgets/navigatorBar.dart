import 'package:flutter/material.dart';

class NavigatorBar extends StatelessWidget {
  String index;
   NavigatorBar({
    required this.index,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        addNavigationBar('Home', context),
        addNavigationBar('About me', context),
        addNavigationBar('Projects', context),
        addNavigationBar('Contact', context)
      ],
    );
  }

  Padding addNavigationBar(String name, BuildContext context) {
    const double sizePadding = 30;
    if(name == index){
      return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sizePadding),
      child: TextButton(
        onPressed: () {},
        child: Text(name, style: Theme.of(context).textTheme.headline3),
      ),
    );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sizePadding),
      child: TextButton(
        onPressed: () {},
        child: Text(name, style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
