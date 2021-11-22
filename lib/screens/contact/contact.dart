import 'package:flutter/material.dart';
import '../../app_screens/custom_scaffold.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

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
