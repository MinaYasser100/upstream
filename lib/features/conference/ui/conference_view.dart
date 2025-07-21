import 'package:flutter/material.dart';
import 'package:upstream/features/conference/ui/widgets/conference_body_view.dart';

class ConferenceView extends StatelessWidget {
  const ConferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ConferenceBodyView());
  }
}
