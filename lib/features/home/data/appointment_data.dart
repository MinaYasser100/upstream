class ScheduleItem {
  final String time;
  final String event;

  ScheduleItem({required this.time, required this.event});
}

final List<ScheduleItem> schedule = [
  ScheduleItem(time: '05:30 ص', event: 'صح النوم'),
  ScheduleItem(time: '06:00 ص', event: 'رحلة إلى السماء (تسبحة والقداس)'),
  ScheduleItem(time: '07:30 ص', event: 'روح وحياة (الكتاب المقدس)'),
  ScheduleItem(time: '08:30 ص', event: 'الفطار'),
  ScheduleItem(time: '09:00 ص', event: 'يالا بينا نعوم'),
  ScheduleItem(time: '01:00 م', event: 'استحمام - تغيير ملابس البحر'),
  ScheduleItem(time: '02:00 م', event: 'الغذاء & شاي'),
  ScheduleItem(time: '03:00 م', event: 'صلاة الغروب'),
  ScheduleItem(time: '03:30 م', event: 'كلمة روحية'),
  ScheduleItem(time: '04:00 م', event: 'دوري ضد التيار'),
  ScheduleItem(time: '06:00 م', event: 'جولة حرة / ورشة عمل (كلنا مع بعض)'),
  ScheduleItem(time: '08:00 م', event: 'العشاء'),
  ScheduleItem(time: '09:00 م', event: 'حفلة السمر'),
  ScheduleItem(time: '10:30 م', event: 'حلقة الصلاة'),
  ScheduleItem(time: '11:00 م', event: 'تصبح على خير يسوع'),
];
