// Model class for conference buttons
import 'package:flutter/material.dart';
import 'package:upstream/core/routing/routes.dart';

class ConferenceButton {
  final String title;
  final IconData icon;
  final String route;

  const ConferenceButton({
    required this.title,
    required this.icon,
    required this.route,
  });
}

// List of conference buttons using the model
const List<ConferenceButton> buttons = [
  ConferenceButton(
    title: 'شفيع المؤتمر',
    icon: Icons.star,
    route: Routes.saintMoses,
  ),
  ConferenceButton(
    title: 'قالوا عن النجاح',
    icon: Icons.format_quote,
    route: Routes.successQuotes,
  ),
  ConferenceButton(
    title: 'الخطوات',
    icon: Icons.directions_walk,
    route: Routes.steps,
  ),
  ConferenceButton(
    title: 'روشتة روحية',
    icon: Icons.healing,
    route: Routes.spiritualPrescription,
  ),
  ConferenceButton(
    title: 'فكر معانا',
    icon: Icons.lightbulb,
    route: Routes.thinkWithUs,
  ),
  ConferenceButton(
    title: 'مطلوب للعمل بأجور مجزية',
    icon: Icons.work,
    route: Routes.jobOpportunities,
  ),
  ConferenceButton(
    title: 'صَوْتُ الرَّبِّ يُطفَيُ لُهُبَ نَارٍ',
    icon: Icons.flare,
    route: Routes.voiceOfLord,
  ),
  ConferenceButton(
    title: 'أقوال آباء',
    icon: Icons.book,
    route: Routes.fathersSaying,
  ),
  ConferenceButton(
    title: 'ترانيم',
    icon: Icons.music_note_outlined,
    route: Routes.hymns,
  ),
];
