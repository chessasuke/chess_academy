import 'package:chess_academy/app_screens/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../app_screens/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      content: Card(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [Text('Joshua'), Text('GM')])),
    );
  }
}
