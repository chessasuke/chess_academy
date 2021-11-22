import 'package:chess_academy/screens/about/about.dart';
import 'package:chess_academy/screens/contact/contact.dart';
import 'package:chess_academy/screens/home/home.dart';
import 'package:chess_academy/screens/lessons/lessons.dart';
import 'package:chess_academy/app_screens/unknown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'route_path.dart';

class PageManager extends ChangeNotifier {
  static PageManager of(BuildContext context) {
    return Provider.of<PageManager>(context, listen: false);
  }

  /// Here we are storing the current list of pages
  List<Page> get pages => List.unmodifiable(_pages);
  List<Page> _pages = [];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PageManager() {
    _pages = [
      const MaterialPage(
        child: HomeScreen(),
        key: Key('Home') as LocalKey,
        name: '/',
      ),
    ];
  }

  /// Handles updating the current path (last page)
  TheAppPath get currentPath {
    final uri = Uri.parse(_pages.last.name!);

    /// Handle '/'
    if (uri.pathSegments.isEmpty) {
      return TheAppPath.home();
    }

    /// Handle '/about'
    else if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'about') {
        return TheAppPath.about();
      }
    }

    /// Handle '/lessons'
    else if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'lessons') {
        return TheAppPath.lessons();
      }
    }

    /// Handle '/contact'
    else if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'contact') {
        return TheAppPath.contact();
      }
    }

    // Handle unknown routes
    return TheAppPath.unknown();
  }

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  /// This is where we handle new route information and manage the pages list
  Future<void> setNewRoutePath(TheAppPath configuration) async {
    if (configuration.isUnknownPage) {
      // Handling 404
      _pages.add(
        MaterialPage(
          child: const UnknownScreen(),
          key: UniqueKey(),
          name: '/404',
        ),
      );
    } else if (configuration.isAboutPage) {
      // about screen
      _pages.add(
        const MaterialPage(
          child: AboutScreen(),
          key: Key('About') as LocalKey,
          name: '/about',
        ),
      );
    } else if (configuration.isLessonsPage) {
      // lessons screen
      _pages.add(
        const MaterialPage(
          child: LessonsScreen(),
          key: Key('Lessons') as LocalKey,
          name: '/lessons',
        ),
      );
    } else if (configuration.isContactPage) {
      // lessons screen
      _pages.add(
        const MaterialPage(
          child: ContactScreen(),
          key: Key('Contact') as LocalKey,
          name: '/contact',
        ),
      );
    } else if (configuration.isHomePage) {
      // Restoring to MainScreen
      _pages.removeWhere(
        (element) => element.key != const Key('Home'),
      );
    }
    notifyListeners();
    return;
  }

  void addAboutPage() {
    setNewRoutePath(TheAppPath.about());
  }

  void addLessonsPage() {
    setNewRoutePath(TheAppPath.lessons());
  }

  void addContactPage() {
    setNewRoutePath(TheAppPath.contact());
  }

  void resetToHome() {
    setNewRoutePath(TheAppPath.home());
  }
}
