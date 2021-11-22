class TheAppPath {
  final bool isHome;
  final bool isAbout;
  final bool isContact;
  final bool isLessons;
  final bool isUnknown;

  TheAppPath.home()
      : isHome = true,
        isLessons = false,
        isAbout = false,
        isContact = false,
        isUnknown = false;

  TheAppPath.lessons()
      : isLessons = true,
        isHome = false,
        isAbout = false,
        isContact = false,
        isUnknown = false;

  TheAppPath.about()
      : isAbout = true,
        isLessons = false,
        isHome = false,
        isContact = false,
        isUnknown = false;

  TheAppPath.contact()
      : isContact = true,
        isLessons = false,
        isAbout = false,
        isHome = false,
        isUnknown = false;

  TheAppPath.unknown()
      : isUnknown = true,
        isLessons = false,
        isAbout = false,
        isContact = false,
        isHome = false;

  bool get isHomePage => isHome == true;
  bool get isAboutPage => isAbout == true;
  bool get isLessonsPage => isLessons == true;
  bool get isContactPage => isContact == true;
  bool get isUnknownPage => isUnknown == true;
}
