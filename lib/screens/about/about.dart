import 'package:chess_academy/app_screens/custom_scaffold.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
            content: Center(
        child: Text('Contact',
            style: Theme.of(context).primaryTextTheme.bodyText1),
      ),
    );
  }
}
