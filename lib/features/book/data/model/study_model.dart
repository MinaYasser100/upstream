class Study {
  final String day;
  final String title;
  final String text;

  const Study({required this.day, required this.title, required this.text});

  Map<String, dynamic> toJson() => {'day': day, 'title': title, 'text': text};

  factory Study.fromJson(Map<String, dynamic> json) => Study(
    day: json['day'] as String,
    title: json['title'] as String,
    text: json['text'] as String,
  );
}
