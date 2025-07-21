class Routes {
  // Singleton instance
  static final Routes _instance = Routes._internal();

  // Private constructor
  Routes._internal();

  // Factory constructor to return the same instance
  factory Routes() {
    return _instance;
  }

  static const String home = '/home_view';
  static const String conferenceSlogan = '/conference_slogan_view';
  static const String bookStudy = '/book_study_view';
}
