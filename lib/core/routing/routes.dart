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
  static const String conference = '/conference_view';
  static const String saintMoses = '/saint_moses_view';
  static const String successQuotes = '/success_quotes_view';
  static const String steps = '/steps_view';
  static const String spiritualPrescription = '/spiritual_prescription_view';
  static const String thinkWithUs = '/think_with_us_view';
  static const String jobOpportunities = '/job_opportunities_view';
}
