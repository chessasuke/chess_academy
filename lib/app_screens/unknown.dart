import 'package:flutter/material.dart';
class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child:
            Text('404!', style: Theme.of(context).primaryTextTheme.bodyText1),
      ),
    );
  }
}
