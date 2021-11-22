// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'route_path.dart';

class TheAppRouteInformationParser extends RouteInformationParser<TheAppPath> {
  @override
  Future<TheAppPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    /// Handle '/'
    if (uri.pathSegments.isEmpty) {
      return TheAppPath.home();
    }

    /// Handle settings
    else if (uri.pathSegments.length == 1) {
      /// about
      if (uri.pathSegments[0] == 'about') {
        return TheAppPath.about();
      }

      /// lessons
      else if (uri.pathSegments[0] == 'lessons') {
        return TheAppPath.lessons();
      }

      /// contact
      else if (uri.pathSegments[0] == 'contact') {
        return TheAppPath.contact();
      }

      /// unknown route
      else {
        return TheAppPath.unknown();
      }
    }

    /// Handle unknown routes
    else {
      return TheAppPath.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(TheAppPath path) {
    if (path.isUnknownPage) {
      return const RouteInformation(location: '/unknown');
    } else if (path.isHomePage) {
      return const RouteInformation(location: '/');
    } else if (path.isAboutPage) {
      return const RouteInformation(location: '/about');
    } else if (path.isContactPage) {
      return const RouteInformation(location: '/contact');
    } else if (path.isLessonsPage) {
      return const RouteInformation(location: '/lessons');
    } else {
      return null;
    }
  }
}
