import 'package:chess_academy/navigator/page_manager.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static VoidCallback getMenuOnTapFunction(String text, BuildContext context) {
    switch (text) {
      case 'Home':
        return () {
          print('return home');
          PageManager.of(context).resetToHome();
        };
      case 'Lessons':
        return () => PageManager.of(context).addLessonsPage();
      case 'About':
        return () => PageManager.of(context).addAboutPage();
      case 'Contact Us':
        return () => PageManager.of(context).addContactPage();
      default:
        return () => PageManager.of(context).resetToHome();
    }
  }
}
